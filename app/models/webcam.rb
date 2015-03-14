class Webcam < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'id'
  belongs_to :categorie, :foreign_key => 'id'
  has_many :comments, dependent: :destroy
  has_many :user, through: :comments
  has_many :favoris, dependent: :destroy
end
