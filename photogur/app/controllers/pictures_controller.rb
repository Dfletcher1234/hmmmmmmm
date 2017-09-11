class PicturesController < ApplicationController

  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]
  before_action :ensure_logged_in, except: [:show, :index]

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def new
    @picture = Picture.new
  end

  def index
    @pictures = Picture.all
  end

  def show
    # @picture = Picture.find(params[:id])
    @comments = @picture.comments
  end

  def edit
    # @picture = Picture.find(params[:id])
  end

  def update
    # @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  def destroy
    # @picture = Picture.find(params[:id])
    if @picture.destroy
      redirect_to pictures_path
    else
      render :show
    end
  end



  def ensure_user_owns_picture
    unless current_user == @picture.user
    flash[:alert] = "Please log in"
    redirect_to new_session_url
    end
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end

  private
  def picture_params
    params.require(:picture).permit(:url, :title, :description)
  end
end
