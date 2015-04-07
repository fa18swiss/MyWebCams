class Favori < ActiveRecord::Base
  belongs_to :user
  belongs_to :webcam

  def self.forUserWebcam(user_id, webcam_id)
    return where("user_id = ? AND webcam_id = ?", user_id, webcam_id)
  end
end
