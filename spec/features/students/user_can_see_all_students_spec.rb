require 'rails_helper'

describe 'User' do
  describe 'visits the students index' do
    before(:all) do
      DatabaseCleaner.clean
    end

    after(:all) do
      DatabaseCleaner.clean
    end

    it 'should see a list of all students' do
      student1 = Student.create!(name: 'Bob')
      student2 = Student.create!(name: 'Sally')
      student3 = Student.create!(name: 'Mary')

      visit students_path

      expect(page).to have_content(student1.name)
      expect(page).to have_content(student2.name)
      expect(page).to have_content(student3.name)
    end
  end
end