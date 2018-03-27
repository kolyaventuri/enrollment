class Address < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  belongs_to :student
end