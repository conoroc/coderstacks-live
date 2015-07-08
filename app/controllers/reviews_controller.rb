class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :edit, :update, :destroy]


  def index

  end


  def create

    @resource = Resource.find(params[:resource_id])
    @review = @resource.reviews.build(review_params)
    @review.user_id = current_user.id

    # @comment = current_user.comments.build(:resource => @resource)
    respond_to do |format|
      if @review.save
        format.html { redirect_to(@resource, :notice => 'Review was successfully created.') }
        format.xml { render :xml => @resource, :status => :created, :location => @resource }
        format.js
      else
        format.html { redirect_to(@resource, :notice =>
            'Review could not be saved. Please fill in all fields') }
        format.xml { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource = Resource.find(params[:resource_id])
    @review.destroy
    redirect_to(@resource, :notice => 'Review was successfully deleted.')
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:content, :score, :resource_id, :user_id)
  end


end
