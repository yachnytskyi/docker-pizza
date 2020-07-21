class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all
    render json: @tags, include: [:posts]
  end

  def create
    @tag = Tag.create!(tag_params)
    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @tag, include: [:posts]
  end

  def update
    render json: @tag, status: :ok if @tag.update(tag_params)
  end

  def destroy
    render json: @tag, status: :no_content if @tag.delete
  end

  private

  def tag_params
    params.permit(:title, :created_by)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
