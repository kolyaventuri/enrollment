# Controller for student routess
class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student.update(student_params)

    if student.save
      flash[:success] = "#{student_params[:name]} updated successfully!"
      redirect_to student_path(student)
    else
      render :edit
    end
  end

  def destroy
    name = student.name
    if student.destroy
      flash[:success] = "#{name} was deleted successfully!"
      redirect_to students_path
    else
      flash[:error] = 'There was a problem in deleting the student.'
      render :student
    end
  end

  private

  def student
    Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name)
  end
end