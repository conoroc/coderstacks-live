class FavoriteResourcesController < ApplicationController
  before_action :set_resource

  def create
    if Favorite.create(favorited: @resource, user: current_user)
      redirect_to @resource, notice: 'Resource has been favorited'
    else
      redirect_to @resource, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @resource.id, user_id: current_user.id).first.destroy
    redirect_to @resource, notice: 'Resource is no longer in favorites'
  end

  private

  def set_resource
    @resource = Resource.find(params[:resource_id] || params[:id])
  end
end