require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits page for a student' do
    it 'should see the name of the student' do
      student = Student.create!(name: 'Bob')

      visit student_page(student)

      expect(page).to have_content(student.namer)
    end
  end
end