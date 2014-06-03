class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :edit, :update, :destroy]


  def index

  end


  def create

    @resource = Resource.find(params[:resource_id])
    @post = @resource.posts.build(post_params)
    @post.user_id = current_user.id

    # @comment = current_user.comments.build(:resource => @resource)
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@resource, :notice => 'Comment was successfully created.') }
        format.xml { render :xml => @resource, :status => :created, :location => @resource }
        format.js
      else
        format.html { redirect_to(@resource, :notice =>
            'Comment could not be saved. Please fill in all fields') }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :resource_id, :user_id)
  end


end
