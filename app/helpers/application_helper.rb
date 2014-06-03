module ApplicationHelper

  def user_likes(current_user, resource_id)
    Like.first(:conditions => ['user_id = ? AND resource_id = ?', current_user, resource_id]).nil?
  end

def nice_time(time)
  time.strftime("%B #{time.day.ordinalize}, %Y")

end


  protected

  def current_user?(user)
    user == current_user
  end


end
