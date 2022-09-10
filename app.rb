require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rent'

class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
  end

  def create_person
    print 'Type (1) to create a Student and (2) to create a Teacher: '
    input = gets.chomp
    while input != '1' && input != '2'
      print 'Please type (1) to create a Student and (2) to create a Teacher: '
      input = gets.chomp
    end
    print 'Enter name: '
    name = gets.chomp
    print 'Enter age: '
    age = gets.chomp

    who_to_create(input, name, age)
  end

  def create_book
    print 'Enter book Title: '
    title = gets.chomp
    print 'Enter Book Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental
    puts 'Select book you want to rent by number: '
    @books.each do |book, index|
      puts "#{index}) #{book}"
    end
    book_index = gets.chomp.to_i

    until book_index.between?(0, @books.length - 1)
      puts 'Please select book you want to rent by number: '
      @books.each do |book, index|
        puts "#{index}) #{book}/n"
      end
      book_index = gets.chomp.to_i
    end

    book = @books[book_index]
    puts 'Select who wants to rent by number: '
    @people.each do |person, index|
      puts "#{index}) #{person}"
    end
    person_index = gets.chomp.to_i

    until person_index.between?(0, @people.length - 1)
      puts 'Please select who wants to rent by number: '
      @people.each do |person, index|
        puts "#{index}) #{person}/n"
      end
      person_index = gets.chomp.to_i
    end

    person = @people[person_index]

    Rental.new(person, book)
  end

  private

  def who_to_create(input, name, age)
    if input == '1'
      print 'Enter classroom: '
      classroom = gets.chomp
      print 'Enter parent permision y/n'
      perm = gets.chomp
      while perm != 'y' && perm != 'n'
        print 'Please enter parent permision y/n'
        perm = gets.chomp
      end
      perm = perm == 'y'
      stud = Student.new(age, classroom, name, perm)
    else
      print 'Enter specialization: '
      specialization = gets.chomps
      stud = Teacher.new(age, specialization, name)
    end
    @people.push(stud)
  end
end
