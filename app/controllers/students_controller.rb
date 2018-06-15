class StudentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:show, :edit]
  protect_from_forgery :except => [:create]

  def new
    @user = User.find(params[:user_id])
    if @user.nickname.present? && @user.nationality.present?
      @student = Student.new
      @student.language_students.build
    else
      redirect_to edit_user_path(current_user), flash: {alert: "すべてのユーザ情報を登録してください"}
    end
  end

  def create
    @user = current_user
    @student = Student.new(student_params)
    @student.id = current_user.id
    if @student.save
      redirect_to student_path(current_user)
    else
      render :new
    end
  end

  def index
    @requests = Request.all
    @q = Student.ransack(params[:q])
    if params[:q].present?
      @students = @q.result(distinct: true).where.not(id: current_user).page(params[:page]).reverse_order
    else
      @students = Student.where.not(id: current_user).page(params[:page]).reverse_order
    end
    @request_s = Request.new
  end

  def show
    if Student.exists?(id: params[:id])
      @student = Student.find(params[:id])
    end
  end

  def edit
    @student = Student.find(params[:id])
    unless @student.language_students.exists?
      @student.language_students.build
    end
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to student_path(@student.id)
  end



  private
  def student_params
    params.require(:student).permit(
									:budget,
									:first_language,
									:message,
									:user_id,
									:what_to_learn,
									:other_language,
									language_students_attributes: [:id, :language_id, :_destroy]
								   )
  end

  def correct_user
    @student = Student.find(params[:id])
      unless current_user.id == @student.id
        redirect_to student_path(current_user)
      end
  end
end