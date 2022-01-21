class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  # Jesus
  def new
  end

  def create
  end

  # Claudia
  def edit
  end
  
  def update
  end
  
  # Ximena
  # GET /categories/:id
  def show
    @category = Category.find(params[:id])
    @photos = @category.photo
    @comments = @category.comment
    # render category/show
  end

  # DELETE /categories/:id
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, status: :see_other
  end
end
