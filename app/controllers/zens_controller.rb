class ZensController < ApplicationController
  before_action :set_zen, only: [:show, :edit, :update, :destroy]

  # GET /zens
  # GET /zens.json
  def index
    @zens = Zen.all
  end

  # GET /zens/1
  # GET /zens/1.json
  def show
  end

  # GET /zens/new
  def new
    @zen = Zen.new
  end

  # GET /zens/1/edit
  def edit
  end

  # POST /zens
  # POST /zens.json
  def create
    @zen = Zen.new(zen_params)

    respond_to do |format|
      if @zen.save
        format.html { redirect_to @zen, notice: 'Zen was successfully created.' }
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
        format.html { redirect_to @zen, notice: 'Zen was successfully updated.' }
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
end
