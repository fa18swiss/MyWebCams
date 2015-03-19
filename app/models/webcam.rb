class Webcam < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  belongs_to :categorie
  has_many :comments, dependent: :destroy
  has_many :favoris, dependent: :destroy
end
=======
  belongs_to :user, :foreign_key => 'id'
  belongs_to :categorie, :foreign_key => 'id'
  has_many :comments, dependent : :destroy
  has_many :user, through : :comments

  validates :nom,
            length : {minimum : 3, maximum : 50,
            too_long : "%{count} characters is the maximum allowed",
            too_short : "must have at least %{count} chars."},
            format : {with : /\A[a-zA-Z_-0-9 ]+\z/, message : "only allows letters"}, presence: true
  validates :url, format : {with : /\Ahttps?:[/]{2}([a-z][a-z0-9]+.)+[a-z][a-z0-9]+[/a-z0-9-_]+.((jpe?g)|(png)|gif)\z/i, message : "Invalid URL"}, presence:true
  validates :latitude, inclusion: => -90..90, presence: true, numericality: true
  validates :longitude, inclusion: => -180..180, presence: true, numericality: true
  validates :longitude, inclusion: => 0..359, presence: true, numericality: true, only_integer: true
end
>>>>>>> lol
