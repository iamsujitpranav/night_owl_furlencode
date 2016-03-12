require 'fast_stemmer'
require 'elasticsearch/model'

class SubCategory < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :category
  
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

# Delete the previous articles index in Elasticsearch
SubCategory.__elasticsearch__.client.indices.delete index: SubCategory.index_name rescue nil

# Create the new index with the new mapping
SubCategory.__elasticsearch__.client.indices.create \
  index: SubCategory.index_name,
  body: { settings: SubCategory.settings.to_hash, mappings: SubCategory.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
SubCategory.import force: :true
