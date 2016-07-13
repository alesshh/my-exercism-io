module BookKeeping
  VERSION = 2
end

class School
  def initialize
    @storage = {}
  end

  def add(student, class_number)
    students = storage[class_number] ||= []
    students << student
    students.sort!
  end

  def grade(class_number)
    Array(storage[class_number])
  end

  def students_by_grade
    storage
  end

  private

  attr_reader :storage
end
