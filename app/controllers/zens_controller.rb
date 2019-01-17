class ZensController < ApplicationController
  before_action :set_zen, only: [:show, :edit, :update, :destroy]
  before_action :require_myself, only: [:edit, :update, :create, :destroy]

  # GET /zens
  # GET /zens.json
  def index
    @zens = Zen.where(deleted: false)
    if params[:id].present?
      set_zen
    else
      @zen = Zen.new
    end
  end

  # GET /zens/1
  # GET /zens/1.json
  def show
  end

  # GET /zens/1/edit
  def edit
  end

  # POST /zens
  # POST /zens.json
  def create
    model_params = zen_params
    model_params[:user_id] = current_user.id
    @zen = Zen.new(model_params)

    respond_to do |format|
      if @zen.save
        format.html { redirect_to zens_url, notice: 'Zen was successfully created.' }
        format.json { render :show, status: :created, location: @zen }
      else
        format.html { render :new }
        format.json { render json: @zen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zens/1
  # PATCH/PUT /zens/1.json
  def update
    respond_to do |format|
      if @zen.update(zen_params)
        format.html { redirect_to zens_url }
        format.json { render :show, status: :ok, location: @zen }
      else
        format.html { render :edit }
        format.json { render json: @zen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zens/1
  # DELETE /zens/1.json
  def destroy
    @zen.destroy
    respond_to do |format|
      format.html { redirect_to zens_url, notice: 'Zen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zen
      @zen = Zen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zen_params
      params.require(:zen).permit(:content, :deleted)
    end

    def require_login
      unless current_user
        redirect_to zens_path, notice: "ログインする必要があります"
      end
    end

    def require_myself
      if current_user.id != Zen.find(params[:id].to_i).user_id
        redirect_to zens_path, notice: "投稿者本人である必要があります"
      end
    end
end
