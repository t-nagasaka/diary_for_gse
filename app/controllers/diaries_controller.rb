class DiariesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @diary = Diary.new
  end

  def create
    current_user.diaries.create!(diary_params)
    redirect_to new_diary_path
  end

  def search
    @choose_date = params[:data][:date]
    @choose_diary = current_user.diaries.find_or_initialize_by(date: @choose_date)
    render json: @choose_diary
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
