class ReadDiseaseOntologyController < ApplicationController
  def is_a
  	@is_a = []
  	File.open("/home/rana/ParsingOntologyFile/HumanDO.obo", "r") do |f|
      f.each_line do |line|
      	if line.include? "is_a"
  	  		@is_a.push(line.split(/! */)[1])
  	  	end
  	  end
	end
	# File is closed automatically at end of block
  end
end
