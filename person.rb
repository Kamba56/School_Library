require_relative 'nameable'

class Person
  attr_reader @id
  attr_accessor @name, @age

  def initialize(age, id = Random.rand(1..1000), name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
