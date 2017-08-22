require 'rails_helper'

RSpec.describe User, type: :model do
    it { should validate_presense_of(:uid) }
    it { should validate_presense_of(:nickname) }
    it { should validate_presense_of(:name) }
    it { should validate_presense_of(:email) }
    it { should validate_presense_of(:image_url) }
    it { should validate_presense_of(:token) }
    it { should validate_presense_of(:provider) }
    it { should validate_presense_of(:created_at) }
    it { should validate_presense_of(:updated_at) }
end

