class Webcam < ActiveRecord::Base
  belongs_to :user
  belongs_to :categorie
  has_many :comments, dependent: :destroy
  has_many :favoris, dependent: :destroy
end
