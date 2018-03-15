class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    
    # attemp 1
    # if params[:sku] & params[:price] then
    #   @products = Product.where(sku: params[:sku]) & @products = Product.where "price > ?", params[:price]
    # -------------------------
    # attemp 2
    
    # if params[:sku] && params[:price] then
    # @products = Product.where(sku: params[:sku])
    # @products = Product.where "price > ?", params[:price]
     # -------------------------
    # attemp 3
    # when params = [:sku && :price] do 
    #   @products = Product.where(sku: params[:sku]) && @products = Product.where "price > ?", params[:price]
      
     # -------------------------
    # attemp 4
    #  if params[:sku] && params[:price] then
    # select * from products where @products = Product.where(sku: params[:sku])&& @products = Product.where "price > ?", params[:price] 
 # -------------------------
    # attemp 5 WORKSSSSSS SUK AND PRICE
    if params[:sku] && params[:price] then
       @products = Product.where(["sku =? or price >?", params[:sku], params[:price]])
    
      #TRYING TO GET ALL THREE TO WORK
      # if params[:sku] && params[:price] && params[:name] then
      #   @products = Product.where(["sku =? or price >? or name =?",  params[:sku], %{params[:name]}%, params[:price]])
    # -------------------------
    # ORIGINAL CODE
    # if params[:sku] then
    #   @products = Product.where(sku: params[:sku])
    # elsif params[:price] then
    #   @products = Product.where "price > ?", params[:price]
    # elsif params[:name] then
    #   @products = Product.where "name like ?",  "%#{params[:name]}%"
    #   # select * from products where name %ood;
    else
        @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:price, :name, :sku)
    end
end
