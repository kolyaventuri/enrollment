require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits a students page' do
    it 'should be able to see all the students courses' do
      student = Student.create!(name: 'Bob')
      course1 = Course.create!(code: 'EEE100', name: 'Intro to Electrical Engineering')
      course2 = Course.create!(code: 'ENG101', name: 'College Writing')
      StudentCourse.create!(student_id: student.id, course_id: course1.id)
      StudentCourse.create!(student_id: student.id, course_id: course2.id)

      visit student_path(student)

      expect(page).to have_content(course1.code)
      expect(page).to have_content(course1.name)

      expect(page).to have_content(course2.code)
      expect(page).to have_content(course2.name)
    end
  end
end