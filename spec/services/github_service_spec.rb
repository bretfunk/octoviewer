require 'rails_helper'
require 'ostruct'

describe GithubService do
  describe "user data" do
    it "finds user data" do
      VCR.use_cassette("services/find_user_data") do

        user = OpenStruct.new(
          id: 3,
          uid: "2019012",
          nickname: "bretfunk",
          name: "Bret Funk",
          email: "bret.e.funk@gmail.com",
          image_url: "https://avatars3.githubusercontent.com/u/20119012?v=4",
          token: ENV['token'],
          provider: "github"
        )

        user_info = GithubService.new(user).user_results

        expect(user_info.class).to eq(Hash)
        expect(user_info).to have_key(:login)
        expect(user_info).to have_key(:followers)
        expect(user_info).to have_key(:email)
        expect(user_info).to have_key(:created_at)
      end
    end
  end

  context "follower activity" do
    it "returns follower's info" do
      VCR.use_cassette("services/find_followers") do

        user = OpenStruct.new(
          id: 3,
          uid: "2019012",
          nickname: "bretfunk",
          name: "Bret Funk",
          email: "bret.e.funk@gmail.com",
          image_url: "https://avatars3.githubusercontent.com/u/20119012?v=4",
          token: ENV['token'],
          provider: "github"
        )

        followers = GithubService.new(user).user_results[:following]

        expect(followers.class).to eq(Array)
        expect(followers.first).to have_key(:repo)
      end
    end
  end

  context "repos" do
    it "returns user repos" do
      VCR.use_cassette("services/find_user_repos") do

        user = OpenStruct.new(
          id: 3,
          uid: "2019012",
          nickname: "bretfunk",
          name: "Bret Funk",
          email: "bret.e.funk@gmail.com",
          image_url: "https://avatars3.githubusercontent.com/u/20119012?v=4",
          token: ENV['token'],
          provider: "github"
        )

        repos = GithubService.new(user).repos_results

        expect(repos.class).to eq(Array)
        expect(repo.first).to have_key(:name)
      end
    end
  end


  context "starred repos" do
    it "returns starred repos" do
      VCR.use_cassette("services/find_starred_repos") do

        user = OpenStruct.new(
          id: 3,
          uid: "2019012",
          nickname: "bretfunk",
          name: "Bret Funk",
          email: "bret.e.funk@gmail.com",
          image_url: "https://avatars3.githubusercontent.com/u/20119012?v=4",
          token: ENV['token'],
          provider: "github"
        )

        starred = GithubService.new(user).starred_results

        expect(starred.class).to eq(Array)
        expect(starred.first).to have_key(:name)
      end
    end
  end

  context "user activity" do
    it "returns user activity" do
      VCR.use_cassette("services/find_user_activity") do

        user = OpenStruct.new(
          id: 3,
          uid: "2019012",
          nickname: "bretfunk",
          name: "Bret Funk",
          email: "bret.e.funk@gmail.com",
          image_url: "https://avatars3.githubusercontent.com/u/20119012?v=4",
          token: ENV['token'],
          provider: "github"
        )

        activity = GithubService.new(user).events_results

        expect(activity.class).to eq(Array)
        expect(activity.first).to have_key(:repo)
      end
    end
  end
end
