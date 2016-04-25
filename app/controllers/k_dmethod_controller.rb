class KDmethodController < ApplicationController
  #Function calculate the hydrophobicity of given AA sequence
  #Read From file the AA and it's degree of hydrophobicity
  #loops on given sequence and puts each caharacter and its corresponding value in new hash 
  def seq_hydrophobicity (seq = "ACGTACGTACGTGGGGAAATTTTCCC")
  	@K_D = Hash.new 
  	@seq_hydrophob = Hash.new 
  	File.open("/home/rana/ParsingOntologyFile/k_D Method.txt", "r") do |f|
  		#loop on each line
    	f.each_line do |line|
    		AA = line.split(" , ")[0]
    		Degree = line.split(" , ")[1]
    		@K_D[AA] << Degree
    	end #end loop on lines

    	#LOOP ON input seq
    	seq.each do |char|
    		@seq_hydrophob[char] >> K_D[char]
    	end #end loop on sequence


  	end #end read file
  end #end Def
end
