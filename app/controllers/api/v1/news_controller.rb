class Api::V1::NewsController < ApplicationController
  before_action :set_news, only: [:show, :update, :destroy]

  # GET /news
  def index
    @news_all = News.all
    render json: @news_all, include: [:category]
  end

  def create
    @news = News.create!(news_params)
    if @news.save
      render json: @news, status: :created
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @news, status: :created
  end

  def update
    render json: @news, status: :ok if @news.update(news_params)
  end

  def destroy
    render json: @news, status: :no_content if @news.delete
  end

  private

  def news_params
    params.permit(:title, :body, :category_id, :created_by)
  end

  def set_news
    @news = News.find(params[:id])
  end
end
