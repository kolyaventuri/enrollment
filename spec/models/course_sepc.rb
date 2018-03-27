require 'rails_helper'

describe Course, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :name }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:student_courses) }
    it { is_expected.to have_many(:students).through(:student_courses) }
  end
end