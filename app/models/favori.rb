class Favori < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'id'
  belongs_to :webcam, :foreign_key => 'id'

  def self.forUserWebcam(user_id, webcam_id)
    return where("user_id = ? AND webcam_id = ?", user_id, webcam_id)
  end
end
