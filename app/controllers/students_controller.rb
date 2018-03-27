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

  private
  def student
    Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name)
  end
end