# notes_app

Update 1: I have coded and been feature testing as I go. However, I have been having trouble conceptualizing the unit tests. I have spoken to other students and have decided that I will use mocking to create the unit test. I will comment out the entirety of the code and unit test from there. I then try dependency injection at a later date - I think I'm able to separate individual notes from the list of notes in list.rb, so my code will have the view_body and add_body methods in a separate file called note.rb.

## The below is to help myself keep track of the feature test I run

recall that the interactive menu gives us the following options:  
1. View all note titles
2. View a body of a note
3. Add a new note title
4. Add contents of a note
5. Delete a note
6. Save the notes to students.csv
7. Load the notes from students.csv
9. Exit

Testing the functionality of Actions 1-5 inclusive:  
```
irb  
require './lib/list.rb'
list = List.new
list.interactive_menu
user_input = 3 # Prompts us to add a note title.
user_input = 'My first note'
user_input = 3
user_input = 'My second note'
user_input = 3
user_input = 'My third, and last, note!'
user_input = 4 # We are asked which note we want to add a body to.
user_input = 1
user_input = 'This is my first note, how exciting!'
user_input = 4
user_input = 2
user_input = 'I have successfully added a note, great!'
user_input = 4
user_input = 3
user_input = 'Okay, let's test the view, shall we?'
user_input = 1 # We should be able to view all 3 note titles with indexes.
user_input = 2 # We are asked which note body we want to view.
user_input = 1 # We should see the text 'This is my first note, how exciting!'.
user_input = 5 # We are prompted to select which note we want to have deleted
user_input = 1 # We should see a list of 2 notes, not including 'My first note'.
```
