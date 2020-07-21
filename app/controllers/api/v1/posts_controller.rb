class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts, include: [:tags]
  end

  def create
    @post = Post.create!(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @post, include: [:tags]
  end

  def update
    render json: @post, status: :ok if @post.update(post_params)
  end

  def destroy
    render json: @post, status: :no_content if @post.delete
  end

  private

  def post_params
    params.permit(:title, :body, :created_by)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

