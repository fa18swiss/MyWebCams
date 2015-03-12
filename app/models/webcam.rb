class Webcam < ActiveRecord::Base
  belongs_to :use
  belongs_to :categorie
  has_many :comments, dependent: :destroy
  has_many :user, through: :comments
end
