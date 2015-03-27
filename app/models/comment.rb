class Comment < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'id'
  belongs_to :webcam, :foreign_key => 'id'
  
   def userCanModify(user)
    return false if user.nil?
    return false if self.user.nil?
    return false if self.user_id.nil?
    return user.id == self.user_id
  end
end
