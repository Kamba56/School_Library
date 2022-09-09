class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(person, book, date)
    @date = date
    @book = book
    @person = person
    person.rental << self
    book.rental << self
  end
end
