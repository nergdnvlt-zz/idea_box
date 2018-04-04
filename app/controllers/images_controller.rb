class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :destroy]

  def show
  end

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash.notice = "#{@image.title} Saved!"
      redirect_to image_path(@image)
    else
      flash.notice = "Image not saved! Try again!"
      render :new
    end
  end

  def destroy
    if @image.destroy
      flash.notice = 'Image Delted!'
      redirect_to images_path
    else
      flash.notcie = "#{@image.title} Not Deleted!"
      redirect_to image_path(@image)
    end
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:src, :title)
    end
end
