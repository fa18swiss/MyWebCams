class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :webcam
  self.per_page = 10
  
   def userCanModify(user)
    return false if user.nil?
    return false if self.user.nil?
    return false if self.user_id.nil?
    return user.id == self.user_id
  end
end
