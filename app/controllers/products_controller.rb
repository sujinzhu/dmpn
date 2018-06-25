class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :new_many, :create_many, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json do
        options = DataTable::Options.new(params)
        @draw = options.draw
        @recordsTotal = Product.count
        query = Product.full_search_query(options.search_string)
        @recordsFiltered = query.count
        @products = query.offset(options.start).order(options.sorting_string).limit(options.length)
      end
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new(batch: Date.today.strftime('%Y%m%d'))
  end

  def new_many
    @batch = Date.today.strftime('%Y%m%d')
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    @product.code += @product.standard unless @product.code[-1] == @product.standard

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

  def create_many
    @category = Category.find(params[:category_id])
    @product_names = params[:names].delete_if {|i, value| value.blank?}.values
    @batch = params[:batch]
    @length = params.fetch(:length, 14)
    @standard = params.fetch(:standard, 'N')

    if (@products = Product.create_many @category, @product_names, @batch, @length, @standard)
      render :create_many
    else
      render :new_many
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
      params.require(:product).permit(:category_id, :name, :code, :batch, :standard)
    end
end
