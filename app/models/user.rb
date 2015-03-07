class User < ActiveRecord::Base
  has_many :comments, depend: :destroy
  has_many :webcam, through: :comments
  has_many :webcams, depend: :destroy
  belongs_to :webcam
end
