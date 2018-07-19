  # we want to create and be able to extract and edit an array of hashes
  # [ { title: "abc", body: "xyz" }, {title: "def", body: "ijk"} ]
class Interactive_Menu
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

	private
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

end
