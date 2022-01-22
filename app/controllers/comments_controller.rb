class CommentsController < ApplicationController
  # POST /categories/:category_id/comments
  # POST /photos/:photo_id/comments
  def create
    @category = Category.find_by_id(params[:category_id]) if params[:category_id]
    @photo = Photo.find_by_id(params[:photo_id]) if params[:photo_id]
    @comment = @category.comments.new(comment_params)
    
    if @comment.save
      puts "--------------------IF!!!--------------------"
      redirect_to category_path(@category) if @category
      redirect_to photo_path(@photo) if @photo
    else
      # render "show", status: :unprocessable_entity
      puts "--------------------ELSE!!!--------------------"
      puts @comment.errors.full_messages
      redirect_to category_path(@category) if @category
      redirect_to photo_path(@photo) if @photo
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :created_at, :commentable_type, :updated_at, commentable_id: params[:category_id])
  end
end
