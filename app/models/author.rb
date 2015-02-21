class Author
	include Mongoid::Document
	field :name, type: String
	field :alternate_names, type: Array
	field :birth_date, type: String  
	field :death_date, type: String  
	field :fuller_name, type: String  
	field :links, type: Array
	field :location, type: String  
	field :publishers, type: Array
	field :website, type: String  
	field :wikipedia, type: String  
	field :bio, type: Array 
end
