module ApplicationHelper

  def user_likes(current_user, resource_id)
    Like.first(:conditions => ['user_id = ? AND resource_id = ?', current_user, resource_id]).nil?
  end





  protected


end
