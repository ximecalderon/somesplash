class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  # Jesus
  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to categories_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  # Claudia
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path
    else
      render "edit", status: :unprocessable_entity
    end
  end
  
  # Ximena
  # GET /categories/:id
  def show
    @category = Category.find(params[:id])
    @photos = @category.photos
    @comments = @category.comments
    @comment = Comment.new
    
    # render category/show
  end

  # DELETE /categories/:id
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to category_path, status: :see_other
  end

  private
  def category_params
    params.require(:category).permit(:name, :description, :cover)
  end
end
