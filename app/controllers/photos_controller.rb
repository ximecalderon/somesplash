class PhotosController < ApplicationController
  # Alonso
  # GET /photos/:id
  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
    @comment = Comment.new
  end

  # E
  def new
  end

  def create
  end

  # F
  def edit
  end

  def update
  end

  # G
  def destroy
  end

  def search
  end
end
