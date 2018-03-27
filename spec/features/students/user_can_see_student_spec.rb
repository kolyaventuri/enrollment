require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
    Student.create!(name: 'Bob')
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits page for a student' do
    it 'should see the name of the student' do
      visit student_path(Student.last)

      expect(page).to have_content(Student.last.name)
    end

    it 'should be able to go to the edit page' do
      visit student_path(Student.last)

      click_on 'Edit'

      expect(current_path).to eq(edit_student_path(Student.last))
    end
  end
end
