class UserController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :create, :destroy]
  before_action :require_myself, only: [:edit, :update]

  def edit
  end

  def show
    @zens = Zen.where(user_id: params[:id]).where(deleted: false).order("created_at DESC").paginate(page: params[:page], :per_page => 30)
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to auth_index_url, notice: t(:nickname_updated) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nickname)
    end

    def require_login
      unless current_user
        redirect_to auth_index_path, notice: "You must be logged in to access this section"
      end
    end

    def require_myself
      if current_user.id != params[:id].to_i
        redirect_to auth_index_path, notice: "You must be logged in to access this section"
      end
    end
end
  