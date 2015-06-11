class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @subcategories = Subcategory.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show

    @search = @subcategory.resources.search(params[:q])
    @resources = @search.result(distinct: true)
    @resource_subcat_id = @subcategory.id
  end

  # GET /categories/new
  def new
    @subcategory = Subcategory.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subcategory_params
    params.require(:subcategory).permit(:name)
  end
end
