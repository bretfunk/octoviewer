require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:created_at) }
  it { should validate_presence_of(:updated_at) }

  it "creates or updates itself from an oauth hash" do
    auth = {"provider"=>"github",
            "uid"=>"16926627",
            "info"=>
    {"nickname"=>"bretfunk",
     "email"=>"bret@bretfunk.com",
     "name"=>"Bret Funk ",
     "image"=>"https://avatars.githubusercontent.com/u/16926627?v=3",
     "urls"=>{"GitHub"=>"https://github.com/bretfunk", "Blog"=>"https://bretfunk.github.io/"}},
    "credentials"=>{"token"=>ENV["token"], "expires"=>false},
    }
      User.find_or_create_by(auth)
      new_user = User.first

      expect(new_user.provider).to eq("github")
  end
end
