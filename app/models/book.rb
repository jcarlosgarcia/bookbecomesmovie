require 'elasticsearch/model'

class Book
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Mongoid::Document
  include Mongoid::Slug

  has_and_belongs_to_many :authors

  # index name for keeping consistency among existing environments
  index_name "books-#{Rails.env}"

  field :title, type: String
  slug :title
  field :subtitle, type: String
  field :descriptiontext, type: String
  field :imagebook, type: String
  field :subjects, type: Array
  field :links, type: Array
  field :subject_places, type: Array
  field :subject_times, type: Array  

  def as_indexed_json
    as_json(except: [:id, :_id])
  end

end
