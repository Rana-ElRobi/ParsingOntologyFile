class ReadDiseaseOntologyController < ApplicationController
  #Function that gets all names in is_a property
  #Open disease ontology file
  #check each line if contains "Is_a"
  #if yes :  parse name part after '!'
  #Check if it is already added in the names list
  #if not : Push to the array	
  def is_a
  	@is_a = Hash.new("" => [])

  	File.open("/home/rana/ParsingOntologyFile/HumanDO.obo", "r") do |f|
      f.each_line do |line|
      	if line.include? "id"
      		id = line.split(/: */)[2]

      	elsif line.include? "is_a"
      		property = line.split(/! */)[1]
      		if ! @is_a.has_key?(property)  
  	  			@is_a[property] = id
  	  		end
  	  	end
  	  end
	end
	# File is closed automatically at end of block
  end
end
