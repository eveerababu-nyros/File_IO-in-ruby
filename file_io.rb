require 'file/utils'

class FileOperation
	#----------------- Selecting Section -------------------
	def select_options
		print "Select any One Option from the Following: \n"
		print "1. Create a New File \n"
		print "2. Opening an Exisiting File \n"
		print "Select your Option: \n"
		@op = gets.chomp.to_i
		case @op
			when 1
				creating_a_File
			when 2
				opening_a_File
			else
				puts "Sorry we cant process your option try again "
				select_options
		end	
	end

		#-------------------- Opening a File ----------------------
	def opening_a_File
		print "Enter File Name:"
		fname = gets.chomp
		if File.file?(fname)
		   File.foreach("#{fname}") { |the_drive| puts the_drive }
		else
			puts "Sorry the File is not Existed try again"
			opening_a_File
		end
	end

	#-------------------- Writing a File ----------------------
	def creating_a_File
		print "Enter File Name:"
		fname = gets.chomp
		print "Enter your Content, Press ^D (CTRL+D) To Save File\n"
		myFile =""
		myFile << $stdin.read
		File::Utils.rewrite  fname, myFile
	end
end
	
	efile = FileOperation.new
	efile.select_options
