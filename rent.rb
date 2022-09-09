class Rental
  attr_accessor :date, :person, :book

  def initialize(person, book, date)
    @date = date
    @book = book
    @person = person
    person.rental << self
    book.rental << self
  end
end
