class Person
  attr_reader @id
  attr_accessor @name, @age
  def initialize(name = "Unknown", age, parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_servises?
    is_of_age?
  end

  private
  def is_of_age?
    return true unless @age < 18
    @age < 18
  end
end
