class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :confirmable, :trackable, :validatable
  has_many :comments, dependent: :destroy
  has_many :webcam, through: :comments
  has_many :webcams, dependent: :destroy
  belongs_to :webcam
end
