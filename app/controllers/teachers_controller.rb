class TeachersController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :correct_user, only: [:show, :edit]
	 protect_from_forgery :except => [:create]
	def new
		@user = User.find(params[:user_id])
		if @user.nickname.present? && @user.nationality.present?
			@teacher = Teacher.new
			@teacher.language_teachers.build
		else
			redirect_to edit_user_path(current_user), flash: {alert: "すべてのユーザ情報を登録してください"}
		end
	end

	def index
		@languages = Language.all
		@requests = Request.all
		@q = Teacher.ransack(params[:q])
		if params[:q].present?
			@teachers = @q.result.where.not(id: current_user).page(params[:page]).reverse_order
		else
			@teachers = Teacher.where.not(id: current_user).page(params[:page]).reverse_order
		end
		@request_t = Request.new
	end

	def create
		@user = current_user
		@teacher = Teacher.new(teacher_params)
		@teacher.id = current_user.id
		if @teacher.save
			redirect_to teacher_path(current_user)
		else
			render :new
		end
	end

	def show
		if Teacher.exists?(id: params[:id])
			@teacher = Teacher.find(params[:id])
		end
	end

	def edit
		@teacher = Teacher.find(params[:id])
		unless @teacher.language_teachers.exists?
			@teacher.language_teachers.build
		end
	end

	def update
		@teacher = Teacher.find(params[:id])
		@teacher.update(teacher_params)
		redirect_to teacher_path(@teacher)
	end

	private

	def teacher_params
		params.require(:teacher).permit(
										:user_id,
										:budget,
										:japanese_level,
										:first_language,
										:message,
										:need_to_bring,
										:background,
										:detailed_place_1,
										:detailed_place_2,
										:detailed_place_3,
										:detailed_address_1,
										:detailed_address_2,
										:detailed_address_3,
										:other_language,
										language_teachers_attributes: [:id, :language_id, :teacher_id, :_destroy]
										)
	end

	def correct_user
		teacher = Teacher.find(params[:id])
			unless teacher.id == current_user.id
				redirect_to teacher_path(current_user)
			end
	end
end
