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

  	#@TypeDef = Hash.new { |property, key| property[key] = [] }
    @TypeDef = {transmitted_by: [] , results_in_formation_of: [] , results_in:  [] , realized_by_supression_with: [] , realized_by: [] , part_of:  [] , occurs_with:  [] , located_in:  [] , is_a: {} }
  	File.open("/home/rana/ParsingOntologyFile/HumanDO.obo", "r") do |f|
      f.each_line do |line|
        
        #loop on all properties in m searching for 
        @TypeDef.each do |property|
          if line.include? "[Term]"
            latest_id = ""
            latest_is_a = ""
          end #end if

          #find ID of the current term
          if line.include? "id: DOID:"
            latest_id = line.split(" ")[1]
          end #end if of id 

          #if the typeDef key is "is_a"
          if property[:key] = "is_a"


          #all proprties in Def 
          else
            if (line.include? "def: ") and (line.include? property)
              property[:key] << latest_id
            end # End if of def 
          

          end #end checking type of property
              

        end #end loop on hash of TypeDef	
        
         
        

        

      	
      		
	end
	# File is closed automatically at end of block
  end


end
