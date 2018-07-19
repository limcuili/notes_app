class Notes

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

end
