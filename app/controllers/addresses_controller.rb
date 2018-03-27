class AddressesController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @student = Student.find(params[:student_id])
    @address.student = @student
    if @address.save
      flash[:success] = 'Added address!'
      redirect_to student_path(@address.student)
    else
      flash[:error] = 'There was an error adding the address.'
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:description, :street, :city, :state, :zip)
  end
end