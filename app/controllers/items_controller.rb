class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @scategory = SubCategory.find(params[:sub_category_id])
    @item = Item.new
  end
  
     def create
     
       @scategory= SubCategory.find(params[:sub_category_id])
       @item = @scategory.items.build(params.require(:item).permit(:name, :body, :avatar))
    
       if @item.save
         flash[:notice] = "Item was saved."
       
         redirect_to sub_category_path(@scategory)
       
     else
         flash[:error] = "There was an error saving the Item. Please try again."
       render :new
     end
   end
  

  def edit
    
    #@mcategory = MainCategory.find(params[:main_category_id])
    @scategory = SubCategory.find(params[:sub_category_id])
    @item = Item.find(params[:id])
    
  end
  
    def update
       # @mcategory= MainCategory.find(params[:main_category_id])
      @scategory = SubCategory.find(params[:sub_category_id])
      @item = Item.find(params[:id])
      if @item.update_attributes(params.require(:item).permit(:name, :body, :avatar))
        flash[:notice] = "Item was updated."
       redirect_to sub_category_path(@scategory)
     else
        flash[:error] = "There was an error saving the item. Please try again."
       render :edit
     end
   end
  
    def destroy
          # @mcategory= MainCategory.find(params[:main_category_id])
           @scategory = SubCategory.find(params[:sub_category_id])
           @item = Item.find(params[:id])
           name = @item.name
 
   
           if @item.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       #redirect_to root_path
       redirect_to sub_category_path(@scategory)
     else
             flash[:error] = "There was an error deleting the Item."
       render :show
     end
   end
  
  
end
