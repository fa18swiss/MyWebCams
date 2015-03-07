class Webcam < ActiveRecord::Base
  belongs_to :user
  has_many :comments, depend: :destroy
  has_many :user, through: :comments
  has_many :categories, depend: :destroy
end
