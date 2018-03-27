require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits a specific student page' do
    it 'should be able to delete the user' do
      student1 = Student.create!(name: 'Bob')
      student2 = Student.create!(name: 'Joe')

      visit student_path(student1)

      click_on 'Delete'

      expect(current_path).to eq(students_path)

      expect(page).to have_content(student2.name)
      expect(page).to have_content("#{student1.name} was deleted successfully!")

      within('#students') do
        expect(page).to_not have_content(student1.name)
      end
    end
  end
end