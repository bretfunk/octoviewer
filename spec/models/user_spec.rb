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
end

