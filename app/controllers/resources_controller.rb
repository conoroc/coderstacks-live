class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new]
  # GET /resources
  # GET /resources.json


  def index
    @search = Resource.search(params[:q])
    #@resources = Resource.all
    @resources = @search.result(distinct: true)
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    session[:user_return_to] = resource_path(@resource)
    #@resources = Resource.all
    @resources = Resource.limit(5)
    @resources_with_likes = @resources.with_likes

    @resource_subcat_id = @resource.subcategory.id
    #@rating = Rating.where(resource_id: @resource.id, user_id: @current_user.id).first unless @rating
  end

  # GET /resources/new
  def new
    @resource = Resource.new
    @categories = Category.all
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = current_user.resources.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:resource).permit(:title, :description, :cost, :category_id, :subcategory_id, :rating, :type, :source, :level, :year, :image, :link, :medium, :user_id)
  end
end
