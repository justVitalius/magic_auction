class ProductsController < ResourcesController
  respond_to :html
  actions :all, :except => [ :show ]

  def update
    update!{ products_path }
  end

  def create
    create!{ products_path }
  end

  protected
  def resource_params
    [params.require(:product).permit(:title, :description, :price, :category_id, images_attributes: ['id', 'image', 'image_cache', 'product_id', '_destroy'])] if params.has_key?(:product)
  end

end