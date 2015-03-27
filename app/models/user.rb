class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :confirmable, :trackable, :validatable
  has_many :comments, dependent: :destroy
  has_many :webcam, through: :comments
  has_many :webcams, dependent: :destroy
  belongs_to :webcam

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_-]+\z/,
      message: "can be alphanumerical characters and '-_' only." }, length: { in: 6..20 }

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

end
