# Be sure to restart your server when you modify this file.

Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['SEARCHBOX_URL']