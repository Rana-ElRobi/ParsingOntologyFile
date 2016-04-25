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



  #Function That Gets all IDs in all properties
  #Open ontology file
  #loop on each line
  # => Clear current ID & current is_A type
  # => Check if line has "ID :"
  # => # => Take current ID
  # => check if line starts with "is_a:"
  # => # => get the type of is_a 
  # => # => check if is_a type is not added before to is_a keys
  # => # => # => if yes : add key & id
  # => # => # => if not : Add id only to existing one
  # => elsif check if line starts with "def:"
  # => # => Loop on all deftypes 
  # => # => # => check if current defType included in def line 
  # => # => # => # => add current ID to current deftype [value]
  #End Loop on ontology file

  def complicated_by

  	#@TypeDef = Hash.new { |property, key| property[key] = [] }
    @TypeDef = {transmitted_by: [] , results_in_formation_of: [] , results_in:  [] , realized_by_supression_with: [] , realized_by: [] , part_of:  [] , occurs_with:  [] , located_in:  [] , is_a: {} }
  	#Open ontology file
    File.open("/home/rana/ParsingOntologyFile/HumanDO.obo", "r") do |f|
      #loop on each line
      f.each_line do |line|
        # => Clear current ID & current is_A type
        if line.include? "[Term]"
            latest_id = ""
            latest_is_a = ""
        end #end if
        # => Check if line has "ID :"
        # => # => Take current ID
        if line.include? "id: DOID:"
          latest_id = line.split(" ")[1]
        end #end id if
        # => check if line starts with "is_a:"
        # => # => get the type of is_a 
        if line.include? "is_a: DOID:"
          latest_is_a = line.split(" ! ")[1]
          # => # => check if is_a type is not added before to is_a keys
          # => # => # => if yes : add key & id
          # => # => # => if not : Add id only to existing one
          if !latest_id.empty? and !latest_is_a.empty?
          @is_a[latest_is_a] << latest_id
          end#end  check key & id
        end #End is_a Contition
        # => elsif check if line starts with "def:"
        elsif (line.include? "def: ")
          # => # => Loop on all deftypes 
          @TypeDef.each do |property|
            # => # => # => check if current defType included in def line 
            if line.include? property
            # => # => # => # => add current ID to current deftype [value]
              @TypeDef[property] << latest_id
            end #end property cheking
          end #end loop on type def
        end #end Def line
      end #End file loop
    end #end read file 
  end #end def  
end #end class controller
