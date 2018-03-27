require 'rails_helper'

describe 'User' do

  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visits course index' do
    it 'should see a list of courses' do
      student = Student.create!(name: 'Bob')
      student2 = Student.create!(name: 'Joe')

      course1 = Course.create!(code: 'EEE100', name: 'Intro to Electrical Engineering')
      course2 = Course.create!(code: 'ENG101', name: 'College Writing')
      course3 = Course.create!(code: 'MAT202', name: 'College Math')
      StudentCourse.create!(student_id: student.id, course_id: course1.id)

      StudentCourse.create!(student_id: student.id, course_id: course2.id)
      StudentCourse.create!(student_id: student2.id, course_id: course2.id)

      StudentCourse.create!(student_id: student2.id, course_id: course3.id)

      visit courses_path

      expect(page).to have_content(course1.code)
      expect(page).to have_content(course2.code)
      expect(page).to have_content(course3.code)

      find("#course_#{course1.id}").click

      expect(current_path).to eq(course_path(course1))
    end
  end

  describe 'visits a specific course page' do
    it 'should only show the students in that course' do
      student = Student.create!(name: 'Bob')
      student2 = Student.create!(name: 'Joe')

      course1 = Course.create!(code: 'EEE100', name: 'Intro to Electrical Engineering')
      course2 = Course.create!(code: 'ENG101', name: 'College Writing')
      course3 = Course.create!(code: 'MAT202', name: 'College Math')
      StudentCourse.create!(student_id: student.id, course_id: course1.id)

      StudentCourse.create!(student_id: student.id, course_id: course2.id)
      StudentCourse.create!(student_id: student2.id, course_id: course2.id)

      StudentCourse.create!(student_id: student2.id, course_id: course3.id)

      visit course_path(course1)

      expect(page).to have_content(student.name)
      expect(page).to_not have_content(student2.name)

      visit course_path(course2)

      expect(page).to have_content(student.name)
      expect(page).to have_content(student2.name)

      visit course_path(course3)

      expect(page).to_not have_content(student.name)
      expect(page).to have_content(student2.name)

    end
  end
end