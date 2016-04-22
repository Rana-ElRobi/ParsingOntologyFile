require "json"
class ParseJasonFileController < ApplicationController

  #Function that parse jason file to get all is_a names
  #and all ids that have this name
  #TODO :: Read File
  # Parse file
  #loop on parsed array of objects
  #check if name is not added before 
  #->Add it as key then add the id as value
  #else
  #-> Add the id to existing key
  #Done 

  def is_a
  	@is_a = {}
	file = File.read("#{Rails.root}/app/assets/jason-human-ontology.json")
	@parsed_array = JSON.parse(file)

	@parsed_array.each do |n|
		#h = {}
		#h.merge!(key: "bar")
		# => {:key=>"bar"}

		#hash.merge!({:item2 => 2})
		is_aType = n["is_a"].split(/! */)[1]
		if ! @is_a.include? is_aType
			#@is_a.merge!({:n["name"]] => n["id"] }) 
			@is_a[:is_aType] = n["id"]
		else
			@is_a[:is_aType] = n["id"] 
		end


	end

  end
end
