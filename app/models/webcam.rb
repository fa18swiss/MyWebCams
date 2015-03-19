class Webcam < ActiveRecord::Base

  belongs_to :user, :foreign_key => 'id'
  belongs_to :categorie, :foreign_key => 'id'
  has_many :comments, dependent: :destroy
  has_many :user, through: :comments

  validates :nom,
            length: {minimum: 3, maximum: 50,
            too_long: "%{count} characters is the maximum allowed",
            too_short: "must have at least %{count} chars."},
            format: { with: /\A[a-zA-Z0-9 _-]+\z/, message: "only allows letters"}, presence: true
  validates :url, format: {with: /\Ahttps?:[\/]{2}([a-z][a-z0-9]+.)+[a-z][a-z0-9]+[\/a-z0-9_-]+.((jpe?g)|(png)|gif)\z/i, message: "Invalid URL"}, presence: true
  validates :latitude, inclusion: { in:-90..90 }, presence: true, numericality: true
  validates :longitude, inclusion: { in: -180..180 }, presence: true, numericality: true
  validates :orientation, inclusion: { in: 0..359 }, allow_blank: true, numericality: true
end

