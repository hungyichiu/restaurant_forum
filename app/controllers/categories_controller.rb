class CategoriesController < ApplicationController

  def show
    @categories = Category.all #列出所有分類
    @category = Category.find(params[:id]) #對應到特定分類 
    @restaurants = @category.restaurants.page(params[:id]).per(9) #透過關聯列出選取類別的餐廳
   
  end
end
