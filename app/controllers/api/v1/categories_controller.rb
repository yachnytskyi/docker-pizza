class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  include Response

  # GET /categories
  def index
    @categories = Category.all
    json_response(@categories)
  end

  def create
    @category = Category.create!(category_params)
    if @category.save
      json_response(@category, :created)
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def show
    json_response(@category)
  end

  def update
    json_response(@category, :ok) if @category.update(category_params)
  end

  def destroy
    json_response(@category, :no_content) if @category.delete
  end

  private

  def category_params
    params.permit(:title, :created_by)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end