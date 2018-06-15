class RequestsController < ApplicationController
  def create
    if Teacher.exists?(id: current_user.id)
      @request_s = Request.new(request_params)
      @request_s.save
      redirect_to students_path(current_user), flash: {notice: "メッセージリクエストを送りました!"}
    else
      redirect_to new_user_teacher_path(current_user), flash: {alert: "先生情報を登録してください!!"}
    end
  end

  def create_2
    if Student.exists?(id: current_user.id)
      @request_t = Request.new(request_params)
      @request_t.save
      redirect_to teachers_path(current_user), flash: {notice: "メッセージリクエストを送りました!"}
    else
      redirect_to new_user_student_path(current_user), flash: {alert: "生徒情報を登録してください!!"}
    end
  end

  def index
    @from_teacher = Request.where(student_id: current_user).where(receiver_id: current_user)
    @from_student = Request.where(teacher_id: current_user).where(receiver_id: current_user)
    @reject = Request.where(student_id: current_user) || Request.where(teacher_id: current_user)
    @sent = Request.where(student_id: current_user)
    @room = Room.new
  end

  def update
    request = Request.find(params[:id])
    request.update(request_params)
    if params[:request][:status]["承認"]
      redirect_to user_requests_path(current_user), flash: {notice: "リクエストを承認しました。"}
    elsif params[:request][:status]["拒否"]
      redirect_to user_requests_path(current_user), flash: {alert: "リクエストを拒否しました。"}
    else
      redirect_to user_requests_path(current_user), flash: {info: "リクエストを保留に戻しました。"}
    end
  end

  def destroy
    request = Request.find(params[:id])
    request.delete
    redirect_to user_requests_path(current_user)
  end

  private
  def request_params
    params.require(:request).permit(:teacher_id, :student_id, :status, :receiver_id, :send_user_id)
  end
end