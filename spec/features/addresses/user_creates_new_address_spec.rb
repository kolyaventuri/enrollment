require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits the add address path for a student' do
    it 'should allow them to add an address' do
      student = Student.create!(name: 'Bob')

      visit new_student_address_path(student)

      description = 'Summer House'
      street = '123 Main'
      city = 'Denver'
      state = 'Colorado'
      zip = 11_111

      expect(page).to have_content("Add address for #{student.name}")

      fill_in 'address[description]', with: description
      fill_in 'address[street]', with: street
      fill_in 'address[city]', with: city
      fill_in 'address[state]', with: state
      fill_in 'address[zip]', with: zip

      click_on 'Create Address'

      expect(current_path).to eq(student_path(student))

      expect(page).to have_content(description)
      expect(page).to have_content(street)
      expect(page).to have_content(city)
      expect(page).to have_content(state)
      expect(page).to have_content(zip)
    end
  end
end