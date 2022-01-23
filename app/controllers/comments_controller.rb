class CommentsController < ApplicationController
  def create
   if params[:category_id]
      # POST /categories/:category_id/comments
      @commentable_object = Category.find_by_id(params[:category_id])
      @category = @commentable_object
      @photos = @category.photos
      commentable_uri = "categories"
      path = category_path(@commentable_object)
   elsif params[:photo_id]
      # POST /photos/:photo_id/comments
      @commentable_object = Photo.find_by_id(params[:photo_id])
      @photo = @commentable_object
      commentable_uri = "photos"
      path = photo_path(@commentable_object)
   end

    @comment = @commentable_object.comments.create(comment_params)
    @comments = params[:category_id]?
                Category.find_by_id(params[:category_id]).comments :
                Photo.find_by_id(params[:photo_id]).comments

    if @comment.save
      redirect_to path
    else
      render "#{commentable_uri}/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    params[:category_id]? 
    (redirect_to controller: 'categories', action: 'show') :
    (redirect_to controller: 'photos', action: 'show')
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
