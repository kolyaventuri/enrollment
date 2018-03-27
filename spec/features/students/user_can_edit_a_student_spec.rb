require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits a student edit page' do
    it 'should be able to update a student' do
      student = Student.create!(name: 'Bob')
      new_name = 'Megan'

      visit edit_student_path(student)

      expect(page).to have_content(student.name)

      fill_in 'student[name]', with: new_name
      click_on 'Update Student'

      expect(current_path).to eq(student_path(student))
      expect(page).to have_content(new_name)
      expect(page).to have_content("#{new_name} updated successfully!")
    end
  end
end
