class DiariesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @diary = current_user.diaries.find_or_initialize_by(date: Date.today)
    @lhob_num = current_user.past_lhob
    lhob_date = Date.today - @lhob_num.day
    @lhob = current_user.diaries.find_or_initialize_by(date: lhob_date)
    @lhib_num = current_user.past_lhib
    lhib_date = Date.today - @lhib_num.day
    @lhib = current_user.diaries.find_or_initialize_by(date: lhib_date)
    @rhib_num = current_user.past_rhib
    rhib_date = Date.today - @rhib_num.day
    @rhib = current_user.diaries.find_or_initialize_by(date: rhib_date)
    @rhob_num = current_user.past_rhob
    rhob_date = Date.today - @rhob_num.day
    @rhob = current_user.diaries.find_or_initialize_by(date: rhob_date)
    @twitter_id = current_user.twitter_id
    @twitter_url = current_user.twitter_url
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
    former_date = Date.today - @prev_date.to_i
    @choose_comment = current_user.diaries.find_or_initialize_by(date: former_date)
    render json: @choose_comment
  end

  def edit
  end

  def update
    current_user.diaries.update!(diary_params)
    redirect_to new_diary_path
  end

  def twitter_id
    twitter_data = params[:twitter_id].to_s
    twitter_split = twitter_data.split("href=")
    twitter_url = twitter_split[1].split(">Tweets by")
    twitter_name = twitter_url[1].split("</a>")
    twitter_url = twitter_url[0]
    twitter_id = twitter_name[0]
    current_user.update!(twitter_id: twitter_id, twitter_url: twitter_url)
    redirect_to new_diary_path
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :comment, :date, user_id: current_user.id)
  end
end
