class SubCategoriesController < ApplicationController
  def index
    @scategories = SubCategory.all
  end

  def show
    #@category = MainCatego
    @scategory = SubCategory.find(params[:id])
  end

  def new
  end

  def edit
  end
end
