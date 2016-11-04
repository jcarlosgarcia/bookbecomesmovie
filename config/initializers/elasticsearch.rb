# config/initializers/elasticsearch.rb
Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL'] || "http://localhost:9200/"

if defined? Mongoid
  Elasticsearch::Model::Response::Result.include Extensions::Elasticsearch::Model::Response::Hashable
end

unless Book.__elasticsearch__.index_exists?
  Book.__elasticsearch__.create_index! force: true
  Book.import
end

unless Author.__elasticsearch__.index_exists?
  Author.__elasticsearch__.create_index! force: true
  Author.import
end

if defined? Mongoid
  Elasticsearch::Model::Response::Result.include Extensions::Elasticsearch::Model::Response::Hashable
end