class LoginsController < ApplicationController
  before_action :require_user, only: [:destroy]
  
  def new 

  end 

  def create 
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:notice] = 'You are logged in'
      redirect_to student
    else
      flash.now[:notice] = 'Email or password was not found'
      render 'new' 
    end 
  end 

  def destroy 
    session[:student_id] = nil 
    flash[:notice] = 'You are logged out'
    redirect_to root_path

  end 
end