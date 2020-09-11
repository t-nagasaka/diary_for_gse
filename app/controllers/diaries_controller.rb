class DiariesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @diary = current_user.diaries.find_or_initialize_by(date: Date.today)
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

  def former_comment
    @prev_position = params[:data][:position]
    @prev_date = params[:data][:date]
    current_user.send("past_#{@prev_position}=", @prev_date)
    current_user.save
    now = Date.today
    ago = now.ago(@prev_date.to_i.days)
    former_date = "#{ago.year}-#{ago.month}-#{ago.day}"
    @choose_comment = current_user.diaries.find_or_initialize_by(date: former_date)
    render json: @choose_comment
  end

  def edit
  end

  def update
    current_user.diaries.update!(diary_params)
    redirect_to new_diary_path
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :comment, :date, user_id: current_user.id)
  end
end
