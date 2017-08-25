require 'rails_helper'
require 'ostruct'

RSpec.feature "user logs in" do
  scenario "using github" do
    VCR.use_cassette("features/github_login") do

        #user = OpenStruct.new(
          #id: 100,
          #uid: "2019012",
          #nickname: "bretfunk",
          #name: "Bret Funk",
          #email: "bret.e.funk@gmail.com",
          #image_url: "https://avatars3.githubusercontent.com/u/20119012?v=4",
          #token: ENV['token'],
          #provider: "github"
        #)

    visit root_path
    stub_omniauth

    expect(page.status_code).to eq(200)
    expect(current_path).to eq(root_path)

    expect(page).to have_link("Login with Github")
    click_link "Login with Github"

    expect(current_path).to eq(user_path)
    expect(page).to have_content("Bret Funk")
    end
  end
end
