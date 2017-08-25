require 'rails_helper'

describe GithubService do
  describe "user data" do
    it "finds user data" do
      VCR.use_cassette("services/find_user_data") do

        user = OpenStruct.new(
          id: 100,
          nickname: "bretfunk",
          uid: "2019012",
          token: ENV['token'],
          name: "Bret Funk")

        user_info = GithubService.new(user).user_results

        expect(user_info.class).to eq(Hash)
        expect(user_info).to have_key(:login)
        expect(user_info).to have_key(:followers)
        expect(user_info).to have_key(:email)
        expect(user_info).to have_key(:created_at)
      end
    end
  end
end
