class CreateStudentCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :student_courses do |t|
      t.references :students
      t.references :courses
    end
  end
end
