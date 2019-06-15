class User < ApplicationRecord
  has_many :zens
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :trackable, :omniauthable, omniauth_providers: %i(google)

  def get_nickname
    return "名無しさん" unless self.nickname
    self.nickname
  end

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(
        provider: auth.provider,
        token:    auth.credentials.token,
        email:    auth.info.email
        )
        # password: Devise.friendly_token[0, 20],
        # meta:     auth.to_yaml)
    end
    user
  end
end
