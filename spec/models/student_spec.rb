require 'rails_helper'

describe Student, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:student_courses) }
    it { is_expected.to have_many(:courses).through(:student_courses) }
  end
end