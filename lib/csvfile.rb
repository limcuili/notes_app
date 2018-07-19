class CSVfile

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
