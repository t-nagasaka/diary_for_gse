class DiariesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @diary = Diary.new
  end

  def create
    diary = Diary.create!(diary_params)
    redirect_to index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :comment)
  end
end
