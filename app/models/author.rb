class Author
  include Mongoid::Document
  belongs_to :book
  field :name, type: String
  field :date, type: String  
end
