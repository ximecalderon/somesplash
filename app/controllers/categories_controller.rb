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
    @photos = @category.photos
    @comments = @category.comments
    @comment = Comment.new
    
    # render category/show
  end

  # # POST /categories/:id/add_comment
  # def add_comment
  #   @category = Category.find(params[:id])
  #   @comment = @category.comments.new(comment_params)

  #   if @comment.save
  #     redirect_to category_path(@comment.commentable_type)
  #   else
  #     render "new", status: :unprocessable_entity
  #   end
  # end

  # # DELETE /categories/:id/remove_comment
  # def remove_comment
  #   @category = Category.find(params[:id])
  #   @comment = Comment.find(params[:id])
  #   @category.comments.delete(@comment)

  #   redirect_to categories_path, status: :see_other
  # end

  # DELETE /categories/:id
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, status: :see_other
  end
end
