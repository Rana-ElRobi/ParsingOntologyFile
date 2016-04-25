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
    		aa = line.split(" , ")[0]
        degree = line.split(" , ")[1]
    		@K_D[:aa] = degree
    	end #end loop on lines

    	#LOOP ON input seq
    	seq.split("").each do |char|
    		@seq_hydrophob[:char] = @K_D[:char]
    	end #end loop on sequence


  	end #end read file
  end #end Def
end
