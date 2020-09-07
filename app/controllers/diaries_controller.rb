class DiariesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @diary = Diary.new
  end

  def create
    # @diary = Diary.new(diary_params)
    # @diary.user_id = current_user.id
    # @diary.save
    current_user.diaries.create!(diary_params)
    redirect_to new_diary_path
  end

  def search
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :comment, :date, user_id: current_user.id)
  end
end
