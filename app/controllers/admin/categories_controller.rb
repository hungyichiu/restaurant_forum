class Admin::CategoriesController < Admin::BaseController
  
  
  before_action :set_category, only:[:update, :destroy]

  def index
    @categories = Category.all

    if params[:id]
      set_category
      #@category = Category.find(params[:id]) 
    else
      @category = Category.new
    end
    
  end

  def update
    #set_category
    #@category = Category.find(params[:id]) 

    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "category was successfuly updated!"
      
    else
      @categories = Category.all
      render :index
      
    end
    
  end

  def destroy
    #set_category
    #@category = Category.find(params[:id])
    @category.destroy
    flash[:alert] = "category was successfully deleted"
    redirect_to admin_categories_path
    
  end

  def create
    @category =  Category.new(category_params)

    if @category.save
      flash[:notice] = "category was successfuly create!"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
