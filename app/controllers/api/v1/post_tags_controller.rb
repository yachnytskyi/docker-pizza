class Api::V1::PostTagsController < ApplicationController
  before_action :set_post_tag, only: [:show, :update, :destroy]

  # GET /post_tags
  def index
    @post_tags = PostTag.all
    render json: @post_tags, include: [:post, :tag]
  end

  def create
    @post_tag = PostTag.create!(post_tag_params)
    if @post_tag.save
      render json: @post_tag, status: :created
    else
      render json: @post_tag.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @post_tag, include: [:post, :tag]
  end

  def update
    render json: @post_tag, status: :ok if @post_tag.update(post_tag_params)
  end

  def destroy
    render json: @post_tag, status: :no_content if @post_tag.delete
  end

  private

  def post_tag_params
    params.permit(:post_id, :tag_id, :created_by)
  end

  def set_post_tag
    @post_tag = PostTag.find(params[:id])
  end
end

