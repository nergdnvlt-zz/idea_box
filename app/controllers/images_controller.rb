class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :destroy]

  def show
  end

  def index
    @images = Image.all
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
end
