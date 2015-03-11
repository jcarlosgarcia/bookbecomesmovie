class Book
  include Mongoid::Document
  has_and_belongs_to_many :authors
  field :title, type: String
  field :subtitle, type: String
  field :descriptiontext, type: String
  field :image, type: String
  field :subjects, type: Array
  field :links, type: Array
  field :subject_places, type: Array
  field :subject_times, type: Array  
end
