class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :registration_token

  has_one :secret_code

  after_create :update_registration_token

  private
  def update_registration_token
    code= SecretCode.find_by(token: registration_token)
    code.update(user_id: self.id)
  end
end
