class IdeasController < ApplicationController
  before_action :set_idea, only: %i[show]
  def index
    @ideas = Idea.all
  end

  def show
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

  private

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
