class Webcam < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favoris, dependent: :destroy

  validates :name,
            length: {minimum: 3, maximum: 50,
            too_long: "%{count} characters is the maximum allowed",
            too_short: "must have at least %{count} chars."},
            format: { with: /\A[a-zA-Z0-9,.éàèüäöôûîâ _-]+\z/, message: "only allows letters"}, presence: true
  validates :url, format: {with: /\Ahttps?:[\/]{2}([a-z][a-z0-9]+.)+[a-z][a-z0-9]+(:[0-9]{1,5})?[\/a-z0-9_-]+.((jpe?g)|(png)|gif)\z/i, message: "Invalid URL"}, presence: true
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :orientation, inclusion: { in: 0..359 }, allow_blank: true, numericality: true


  def userCanModify(user)
    return false if user.nil?
    return false if self.user.nil?
    return false if self.user_id.nil?
    return user.id == self.user_id
  end
  def userHasFavorite(user)
    return false if user.nil?
    return Favori.where("user_id = ? AND webcam_id = ?", user.id, self.id).count > 0
  end
end

