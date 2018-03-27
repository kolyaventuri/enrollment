require 'rails_helper'

describe StudentCourse, type: :model do
  it { is_expected.to have_many(:students) }
  it { is_expected.to have_many(:courses) }
end