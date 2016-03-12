require 'fast_stemmer'
require 'elasticsearch/model'
class Category < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  has_many :sub_categories, dependent: :destroy
  has_many :stores, dependent: :destroy
  
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['name^10', 'description']
          }
        }
      }
    )
  end
  settings index: { number_of_shards: 10 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
      indexes :description, analyzer: 'english'
    end
  end
end
# Delete the previous categories index in Elasticsearch
Category.__elasticsearch__.client.indices.delete index: Category.index_name rescue nil

# Create the new index with the new mapping
Category.__elasticsearch__.client.indices.create \
  index: Category.index_name,
  body: { settings: Category.settings.to_hash, mappings: Category.mappings.to_hash }

# Index all categories records from the DB to Elasticsearch
Category.import force: :true