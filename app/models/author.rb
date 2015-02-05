class Author
  include Mongoid::Document
  belongs_to :book, :foreign_key => "authors_id"# foreign key - author_id
  field :name, type: String
  field :date, type: String  
end
