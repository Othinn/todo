class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :delete_all
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validate :validate_username
  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  attr_writer :login

  def login
    @login || self.username || self.email
  end




  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(['lower(username) = :value OR lower(email) = :value',
                               { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
