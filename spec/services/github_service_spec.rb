require 'rails_helper'

describe GithubService do
  describe "user data" do
    it "finds user data" do
      VCR.use_cassette("services/find_user_data") do
        user_data = User.user_results(current_user)


      end
    end
  end
end
