class WelcomeController < ApplicationController


  def landing
    @search = Resource.search(params[:q])
    #@resources = Resource.all
    @resources = @search.result(distinct: true).limit(5)
  end
end
