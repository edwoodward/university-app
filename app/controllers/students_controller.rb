class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user, only: [:edit, :update]

  def index 
    @students = Student.all
  end 

  def new 
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save 
      flash[:success] = "You have successfully signed up"
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def show 
  end 

  def edit 
  end 

  def update 
    if @student.update(student_params) 
      flash[:success] = "You have successfully updated your profile"
      redirect_to student_path(@student)
    else 
      render 'edit'
    end

  end 

  private 

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end

  def require_same_user
    if helpers.current_user != @student
      flash[:danger] = "You can only edit your own profile"
      redirect_to students_path
    end
  end
end