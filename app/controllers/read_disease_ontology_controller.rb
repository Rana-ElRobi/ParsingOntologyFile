class ReadDiseaseOntologyController < ApplicationController
  def is_a
  	@is_a = []
  	File.open("/home/rana/ParsingOntologyFile/HumanDO.obo", "r") do |f|
      f.each_line do |line|
      	if line.include? "is_a"
      		property = line.split(/! */)[1]
      		if ! @is_a.include? property
  	  			@is_a.push(property)
  	  		end
  	  	end
  	  end
	end
	# File is closed automatically at end of block
  end
end
