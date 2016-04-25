class KDmethodController < ApplicationController
  #Function calculate the hydrophobicity of given AA sequence
  #Read From file the AA and it's degree of hydrophobicity
  #loops on given sequence and puts each caharacter and its corresponding value in new hash 
  def seq_hydrophobicity (seq = "ACGTACGTACGTGGGGAAATTTTCCC")
    @k_d = Hash.new 
  	@seq_hydrophob = Hash.new 
  	File.open("#{Rails.root}/k_D Method.txt", "r") do |f|
  		#loop on each line
    	f.each_line do |line|
    		aa, degree = line.split(", ")
    	  @k_d[aa] = degree
    	end #end loop on lines

    	#LOOP ON input seq
    	seq.split("").each do |char|
    		@seq_hydrophob[char] = @k_d[char]
    	end #end loop on sequence


  	end #end read file
  end #end Def
end
