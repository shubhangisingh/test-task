class SecretCode < ApplicationRecord

  belongs_to :user, optional: true

  before_create :generate_token


  def self.check_token(new_token)
     SecretCode.exists?(token: new_token, user: nil)
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless SecretCode.exists?(token: random_token)
    end
  end
end
