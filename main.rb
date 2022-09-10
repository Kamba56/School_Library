require_relative 'app'

def ask_user
  print "Select what do you want to do /n"
  puts "1 List all books.
    2 List all people.
    3 Create a person.
    4 Create a book.
    5 Create a rental.
    6 Exit."
  gets.chomp.to_i
end

def main
  my_app = App.new()
  
  loop do
    choice = ask_user until choice.between?(1,6)
    break if choice == 6
    process_choice(choice, my_app)
  end
end
