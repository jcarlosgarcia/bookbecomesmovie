class Book
  include Mongoid::Document
  has_and_belongs_to_many :authors
  field :title, type: String
  field :description, type: String
end
