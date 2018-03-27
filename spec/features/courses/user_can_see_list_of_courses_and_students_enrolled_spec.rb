require 'rails_helper'

describe 'User' do
  describe 'visits course index' do
    it 'should see a list of courses and enrolled students' do
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

      within('#course_1') do
        expect(page).to have_content(student.name)
        expect(page).to_not have_content(student2.name)
      end

      within('#course_2') do
        expect(page).to have_content(student.name)
        expect(page).to have_content(student2.name)
      end

      within('#course_3') do
        expect(page).to have_content(student2.name)
        expect(page).to_not have_content(student.name)
      end
    end
  end
end