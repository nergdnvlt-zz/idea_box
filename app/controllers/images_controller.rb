class ImagesController < ApplicationController
  before_action :set_image, only: [:show]

  def index
    @images = Image.all
  end

  def show
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end
end
