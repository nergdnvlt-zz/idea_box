class IdeasController < ApplicationController
  before_action :set_idea, only: %i[show edit update destroy]
  
  def show
  end

  def edit
  end

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash.notice = "#{@idea.title} added."
      redirect_to idea_path(@idea)
    else
      flash.notice = 'Idea not added. Try again.'
      render :new
    end
  end

  def update
    if @idea.update(idea_params)
      flash.notice = "#{@idea.title} edited."
      redirect_to idea_path(@idea)
    else
      flash.notice = "#{@idea.title} not edited. Try again."
      render :new
    end
  end

  def destroy
    if @idea.destroy
      flash.notice = 'Idea Deleted!'
      redirect_to ideas_path
    else
      redirect_to idea_path(@idea)
    end
  end

  private

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :body, :category_id)
    end
end
