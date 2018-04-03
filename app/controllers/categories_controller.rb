class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def show
  end

  def edit
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash.notice = "#{@category.name} created!"
      redirect_to category_path(@category)
    else
      flash.notice = 'Category not created, try again.'
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash.notice = "#{@category.name} Updated!"
      redirect_to category_path(@category)
    else
      flash.notice = "#{@category.name} Not Updated, Try Again."
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash.notice = 'Category Deleted!'
      redirect_to categories_path
    else
      flash.notice = "#{@category} Not Deleted!"
      redirect_to category_path(@category)
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
