require 'rails_helper'

describe 'User' do
  describe 'visits index' do
    it 'should see the navigation bar' do
      visit '/'

      expect(page).to have_selector('ul.top-nav')
      expect(page).to have_link('Students')
    end
  end

  describe 'visits student index' do
    it 'should see the navigation bar' do
      visit students_path

      expect(page).to have_selector('ul.top-nav')
      expect(page).to have_link('Students')
    end
  end
end