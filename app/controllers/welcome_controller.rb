class WelcomeController < ApplicationController


  def landing
    @resources = Resource.all
  end
end
