class Author
	include Mongoid::Document
	field :name, type: String
	field :alternate_names: Array
	field :birth_date, type: String  
	field :death_date, type: String  
	field :fuller_name, type: String  
	field :links, type: Array
	field :location, type: String  
	field :publishers, type: Array
	field :website, type: String  
	field :wikipedia, type: String  
bio


	borrar:
	"date",
	"comment",
	"dewey_decimal_class",
	"entity_type",
	"lc_classifications",
	"lccn",
	"languages",
	"last_modified",
	"latest_revision",
	marc
	personal_name
	"publish_country",
	"publish_date",
	"publish_places",
	subtitle
	tags
	title_prefix


end
