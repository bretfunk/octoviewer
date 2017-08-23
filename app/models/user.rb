class User < ApplicationRecord
  #validates :uid, presence: :true
  #validates :nickname, presence: :true
  #validates :name, presence: :true
  #validates :email, presence: :true
  #validates :image_url, presence: :true
  #validates :token, presence: :true
  #validates :provider, presence: :true
  #validates :created_at, presence: :true
  #validates :updated_at, presence: :true

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.nickname = auth['info']['nickname']
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.image_url = auth['info']['image']
    user.token = auth ['credentials']['token']
    user.save
    user
  end
end
