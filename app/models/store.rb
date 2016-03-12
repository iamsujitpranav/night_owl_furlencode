require 'fast_stemmer'
require 'elasticsearch/model'

class Store < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :category
  belongs_to :sub_category
  
  has_many :locations, dependent: :destroy
  has_one :address, dependent: :destroy
  
  
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['store_name^10', 'description','open_time','close_time']
          }
        }
      }
    )
  end
  
  settings index: { number_of_shards: 10 } do
    mappings dynamic: 'false' do
      indexes :store_name, analyzer: 'english'
      indexes :description, analyzer: 'english'
      indexes :open_time
      indexes :close_time
    end
  end
end



# Delete the previous articles index in Elasticsearch
Store.__elasticsearch__.client.indices.delete index: Store.index_name rescue nil

# Create the new index with the new mapping
Store.__elasticsearch__.client.indices.create \
  index: Store.index_name,
  body: { settings: Store.settings.to_hash, mappings: Store.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Store.import force: :true
