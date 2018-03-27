require 'rails_helper'

describe StudentCourse, type: :model do
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:course) }
end