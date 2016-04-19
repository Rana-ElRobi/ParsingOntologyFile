require "json"
class ParseJasonFileController < ApplicationController
  def is_a
	file = File.read("#{Rails.root}/app/assets/jason-human-ontology.json")
	@parsed_array = JSON.parse(file)
  end
end
