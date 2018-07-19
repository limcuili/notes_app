  # we want to create and be able to extract and edit an array of hashes
  # [ { title: "abc", body: "xyz" }, {title: "def", body: "ijk"} ]
class List
	attr_reader :list
	def initialize
		@list = []
	end

	def interactive_menu
		loop do
			print_menu
			process(STDIN.gets.chomp)
		end
	end

	def print_menu
		puts " "
		puts "-------"
	  puts "1. View all note titles"
	  puts "2. View a body of a note"
	  puts "3. Add a new note title"
	  puts "4. Add contents of a note"
		puts "5. Delete a note"
		puts "6. Save the notes to students.csv"
		puts "7. Load the notes from students.csv"
		puts "9. Exit"
		puts "-------"
	end

	def process(selection)
		case selection
			when "1"
				view_titles
			when "2"
				view_body
			when "3"
				add_title
			when "4"
				add_body
			when "5"
				delete_note
			when "6"
				save_notes
			when "7"
				load_notes
			when "9"
				exit
			else
				puts "I don't know what you mean, try again"
		end
	end

	def view_titles
		@list.each_with_index do |note,index|
			puts "#{index + 1}. #{note[:title]}"
		end
	end

	def view_body
		view_titles
		puts "which note would you like to view"
		index = gets.chomp.to_i
		puts @list[index - 1][:body]
	end

	def add_title
		puts 'Please input title'
		new_title = gets.chomp
		@list << { :title => new_title, :body => nil }
		print @list
	end

	def add_body
		view_titles
		puts 'which title would you like to add a body to?'
		index = gets.chomp.to_i
		puts "type the text you want to add"
		@list[index - 1]
		text = gets.chomp
		@list[index - 1].replace({ :title => @list[index - 1][:title], :body => text })
	end

	def delete_note
		view_titles
		puts 'which note would you like to delete?'
		index = gets.chomp.to_i
		@list.slice!(index - 1)
		@list
	end

	def save_notes
		# open the file for writing
		file = File.open("notes.csv", "w")
		@list.each do |note|
			note_data = [note[:title], note[:body]]
			csv_line = note_data.join(",")
			file.puts csv_line
		end
	end

	def load_notes
		file = File.open("notes.csv", "r")
		file.readlines.each do |note|
			title, body = note.chomp.split(',')
			@list << { :title => title, :body => body }
		end
		file.close
	end
end
