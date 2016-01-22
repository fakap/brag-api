class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :username,   presence: true
  validates :email,      presence: true, uniqueness: { case_sensitive: false }
  validates :password,   presence: true, length: { minimum: 8 }

  private

    def generate_authentication_token!
      loop do
        self.authentication_token = SecureRandom.base64(64)
        break unless User.find_by(authentication_token: authentication_token)
      end
    end
end
