# A student
class Student < ApplicationRecord
  validates_presence_of :name

  has_many :addresses

  has_many :student_courses
  has_many :courses, through: :student_courses
end