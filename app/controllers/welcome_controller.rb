class WelcomeController < ApplicationController


  def landing
    @search = Resource.search(params[:q])
    #@resources = Resource.all
    @resources = @search.result(distinct: true)
  end
end
