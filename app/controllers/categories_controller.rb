class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update]

  def edit
  end

  def index
    @categories = Category.all
  end

  def show
    @ideas = @category.ideas.all
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


  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
