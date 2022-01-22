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

  # GET /search
  def search
    @photos = Photo.all
    # render search
  end

  # GET /search_results?query=x
  def search_results
    query = params[:query].downcase
    @photos = Photo.where("LOWER(name) LIKE ?", "%#{query}%")
    # render search_results
  end
end
