class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
    render json: @categories, include: [:news]
  end

  def create
    @category = Category.create!(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @category, include: [:news]
  end

  def update
    render json: @category, status: :ok if @category.update(category_params)
  end

  def destroy
    render json: @category, status: :no_content if @category.delete
  end

  private

  def category_params
    params.permit(:title, :created_by)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end