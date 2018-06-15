class FavoritesController < ApplicationController
  def create
    teacher = Teacher.find(params[:teacher_id])
    favorite = current_user.student.favorites.new(teacher_id: teacher.id)
    favorite.save
    redirect_to teacher_path(teacher)
  end

  def destroy
    teacher = Teacher.find(params[:teacher_id])
    favorite = current_user.student.favorites.find_by(teacher_id: params[:teacher_id])
    favorite.destroy
    redirect_to teacher_path(teacher)
  end
end

