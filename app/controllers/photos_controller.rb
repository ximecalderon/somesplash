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
    @photos = Photo.new(category_id: params[:category_id])
    @category = Category.find(params[:category_id])
  end
 #Guiarse desde aqui
  def create
    @photos = Photo.new(photo_params)

    if @photos.save
      redirect_to category_path(@photos.category)
    else
      render "new", status: :unprocessable_entity
    end
  end

  # F
  def edit
    @photos = Photo.find(params[:id])
    @categories = Category.all
  end

  def update
    @photos = Photo.where(id: params[:id])[0]

    if @photos.update(photo_params)
      redirect_to category_path(@photos.category)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # G
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to controller: 'categories', action: 'show'
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

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :category_id, :image)
  end
end
