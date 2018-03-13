class TribblesController < ApplicationController
  before_action :set_tribble, only: [:show, :edit, :update, :destroy]

  # GET /tribbles
  # GET /tribbles.json
  def index
    @tribbles = Tribble.all
  end

  # GET /tribbles/1
  # GET /tribbles/1.json
  def show
  end

  # GET /tribbles/new
  def new
    @tribble = Tribble.new
  end

  # GET /tribbles/1/edit
  def edit
  end

  # POST /tribbles
  # POST /tribbles.json
  def create
    @tribble = Tribble.new(tribble_params)

    respond_to do |format|
      if @tribble.save
        format.html { redirect_to @tribble, notice: 'Tribble was successfully created.' }
        format.json { render :show, status: :created, location: @tribble }
      else
        format.html { render :new }
        format.json { render json: @tribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tribbles/1
  # PATCH/PUT /tribbles/1.json
  def update
    respond_to do |format|
      if @tribble.update(tribble_params)
        format.html { redirect_to @tribble, notice: 'Tribble was successfully updated.' }
        format.json { render :show, status: :ok, location: @tribble }
      else
        format.html { render :edit }
        format.json { render json: @tribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tribbles/1
  # DELETE /tribbles/1.json
  def destroy
    @tribble.destroy
    respond_to do |format|
      format.html { redirect_to tribbles_url, notice: 'Tribble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tribble
      @tribble = Tribble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tribble_params
      params.require(:tribble).permit(:spaceship, :colour, :quantity)
    end
end
