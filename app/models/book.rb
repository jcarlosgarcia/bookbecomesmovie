class Book
  include Mongoid::Document
  has_many :authors
  field :title, type: String
  field :description, type: String
  field :author_id
end
