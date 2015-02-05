class Book
  include Mongoid::Document
  has_many :authors
  field :_id
  field :title, type: String
  field :description, type: String
  field :authors_id
end
