class Portal::ProductsController < Portal::ApplicationController
  
  def index
    @page_header = "产品列表"
    @action = new_portal_product_path
    @products = Product.sorted.recent.paginate page: params[:page], per_page: 30
  end
  
  def show
    @page_header = "产品详情"
    @product = Product.find_by(pid: params[:id])
  end
  
  def new
    @page_header = "新建产品"
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_products)
    @product.owner_id = current_member.id
    if @product.save
      flash[:success] = '创建成功'
      redirect_to portal_products_url
    else
      puts @product.errors.full_messages
      render :new
    end
  end
  
  def edit
    @page_header = "更新产品"
    @product = Product.find_by(pid: params[:id])
  end
  
  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_products)
      flash[:success] = '更新成功'
      redirect_to portal_products_url
    else
      render :edit
    end
  end
  
  def destroy
    @product = Product.find_by(pid: params[:id])
    @product.destroy
    flash[:success] = '删除成功'
    redirect_to portal_products_url
  end
  
  private
  def product_products
    params.require(:product).permit(:name, :intro, :body, :image, :stock, :sort, :price, :discount_price, :photos_quantity)
  end
end