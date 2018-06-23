class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  def edit
    @user = User.find(params[:id])
    unless @user.user_areas.exists?
      @user.user_areas.build
    end
  end

  def update
    @user = User.find(params[:id])
      #以下のコメントアウトはコレクションチェックボックスの場合。attributesとモデルのattributes_forは無し。
      # エディットの際チェック済みデータが入らないため断念。セレクトに切り替え。
      # areas = params[:user][:user_areas][:area_id]
    @user.update(user_params)

      # areas.each do |area|
      # user_area = @user.user_areas.new
      # user_area.area_id = area
      # user_area.save
      # end
    redirect_to user_path(current_user)
  end


  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(
								  :nickname,
								  :nationality,
								  :age,
								  :gender,
								  :image,
								  user_areas_attributes: [:id, :area_id, :user_id, :_destroy]
								)
  end

  def correct_user
    user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to user_path(current_user)
      end
  end

end
