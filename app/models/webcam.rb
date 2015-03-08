class Webcam < ActiveRecord::Base
  belongs_to :user
  belongs_to :categorie
  has_many :comments, depend: :destroy
  has_many :user, through: :comments
end
