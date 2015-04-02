class Favori < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'id', dependent: :destroy
  belongs_to :webcam, :foreign_key => 'id', dependent: :destroy

  def self.forUserWebcam(user_id, webcam_id)
    return where("user_id = ? AND webcam_id = ?", user_id, webcam_id)
  end
end
