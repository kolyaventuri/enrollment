require 'rails_helper'

def random_name
  rand(36**8).to_s(36)
end

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits the new user page' do
    it 'should alow them to create a new student' do
      visit new_student_path
      name = random_name

      fill_in 'student[name]', with: name

      click_on 'Create Student'

      expect(current_path).to eq('/students/1')

      expect(page).to have_content(name)
      expect(page).to have_content("#{name} added successfully!")
    end
  end
end
