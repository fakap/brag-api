class User < ActiveRecord::Base
  has_secure_password
  has_many :brags, dependent: :destroy

  validates :first_name, {
    presence: true
  }
  validates :last_name, {
    presence: true
  }
  validates :username, {
    presence: true,
    uniqueness: { case_sensitive: false },
  }
  validates :email, {
    presence: true,
    uniqueness: { case_sensitive: false },
  }
  validates :password, {
    length: { minimum: 8 },
    allow_nil: true,
  }

  def generate_authentication_token!
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: authentication_token)
    end
  end
end
