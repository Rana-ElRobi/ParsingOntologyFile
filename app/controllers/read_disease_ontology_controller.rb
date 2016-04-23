class ReadDiseaseOntologyController < ApplicationController
  
  #Function that gets all names in is_a property
  #Open disease ontology file
  #take id of each block
  #check each line if contains "Is_a"
  #if yes :  parse name part after '!'
  #Check if it is already added in the names list
  #if not :
  # =>  Push to the hash as key
  #	=>	add the id in array of values 	
  def is_a
  	@is_a = Hash.new { |is_a,key| is_a[key]= [] }
    latest_id = ""
    latest_is_a = ""
  	File.open("/home/rana/ParsingOntologyFile/HumanDO.obo", "r") do |f|
      f.each_line do |line|
  
        if line.include? "[Term]"
          latest_id = ""
          latest_is_a = ""
        end

        if line.include? "id: DOID:"
          latest_id = line.split(" ")[1]
        elsif line.include? "is_a: DOID:"
          latest_is_a = line.split(" ! ")[1]
        end

        if !latest_id.empty? and !latest_is_a.empty?
          @is_a[latest_is_a] << latest_id
        end
    	end
  	end
  end



  #Function That Gets all names of complicated_by
  def complicated_by
  	@complicated_by = Hash.new { |complicated_by, key| complicated_by[key] = [] }
  	File.open("/home/rana/ParsingOntologyFile/HumanDO.obo", "r") do |f|
      f.each_line do |line|
      	if line.include? "id"
      		id = line.split(/: */)[2]

      	elsif (line.include? "def: ") and (line.include? "complicated_by")
	      		property = line.split(/, */)[1]
	      	
      		if ! @complicated_by.has_key?(property)  
  	  			@complicated_by[property] = id
  	  		end
  	  	end
  	  end
	end
	# File is closed automatically at end of block
  end


end
