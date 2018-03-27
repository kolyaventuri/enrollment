require 'rails_helper'

describe 'User' do
  describe 'visits the students index' do
    before(:all) do
      DatabaseCleaner.clean
      @student1 = Student.create!(name: 'Bob')
      @student2 = Student.create!(name: 'Sally')
      @student3 = Student.create!(name: 'Mary')
    end

    after(:all) do
      DatabaseCleaner.clean
    end

    it 'should see a list of all students' do
      visit students_path

      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student2.name)
      expect(page).to have_content(@student3.name)
    end

    it 'should be able to click on a specific student' do
      visit students_path

      click_on @student1.name

      expect(current_path).to eq(student_path(@student1))
      expect(page).to have_content(@student1.name)
      expect(page).to_not have_content(@student2.name)
    end
  end
end