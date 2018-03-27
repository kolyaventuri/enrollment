# A student
class Student < ApplicationRecord
  validates_presence_of :name

  has_many :addresses
end