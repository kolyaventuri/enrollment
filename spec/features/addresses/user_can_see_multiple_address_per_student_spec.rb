require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits student' do
    it 'should be able to see multiple addresses' do
      student = Student.create!(name: 'Bob')
      student2 = Student.create!(name: 'Joe')
      addr1 = Address.create!(
        description: 'House 1',
        street: '123 Main',
        city: 'Denver',
        state: 'Colorado',
        zip: 11_111,
        student: student
      )

      addr2 = Address.create!(
        description: 'House 2',
        street: '625 South',
        city: 'Los Angeles',
        state: 'California',
        zip: 22_222,
        student: student
      )

      visit student_path(student)

      expect(page).to have_content(addr1.description)
      expect(page).to have_content(addr1.street)
      expect(page).to have_content(addr1.state)
      expect(page).to have_content(addr1.city)
      expect(page).to have_content(addr1.zip)

      expect(page).to have_content(addr2.description)
      expect(page).to have_content(addr2.street)
      expect(page).to have_content(addr2.state)
      expect(page).to have_content(addr2.city)
      expect(page).to have_content(addr2.zip)

      visit student_path(student2)

      expect(page).to_not have_content(addr1.street)
      expect(page).to_not have_content(addr2.street)
    end
  end
end