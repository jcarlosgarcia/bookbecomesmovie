class Author
  include Mongoid::Document
  field :name, type: String
  field :date, type: String
end
