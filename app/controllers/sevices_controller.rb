class SevicesController < ApplicationController
  before_action :set_sevice, only: [:show, :edit, :update, :destroy]

  # GET /sevices
  # GET /sevices.json
  def index
    @sevices = Sevice.all
  end

  # GET /sevices/1
  # GET /sevices/1.json
  def show
  end

  # GET /sevices/new
  def new
    @sevice = Sevice.new
  end

  # GET /sevices/1/edit
  def edit
  end

  # POST /sevices
  # POST /sevices.json
  def create
    @sevice = Sevice.new(sevice_params)

    respond_to do |format|
      if @sevice.save
        format.html { redirect_to @sevice, notice: 'Sevice was successfully created.' }
        format.json { render :show, status: :created, location: @sevice }
      else
        format.html { render :new }
        format.json { render json: @sevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sevices/1
  # PATCH/PUT /sevices/1.json
  def update
    respond_to do |format|
      if @sevice.update(sevice_params)
        format.html { redirect_to @sevice, notice: 'Sevice was successfully updated.' }
        format.json { render :show, status: :ok, location: @sevice }
      else
        format.html { render :edit }
        format.json { render json: @sevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sevices/1
  # DELETE /sevices/1.json
  def destroy
    @sevice.destroy
    respond_to do |format|
      format.html { redirect_to sevices_url, notice: 'Sevice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sevice
      @sevice = Sevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sevice_params
      params.require(:sevice).permit(:name, :cost, :time)
    end
end
