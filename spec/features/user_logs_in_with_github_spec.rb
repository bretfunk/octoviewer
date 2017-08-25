require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github" do
    VCR.use_cassette("features/github_login") do

        user = OpenStruct.new(
          id: 100,
          nickname: "bretfunk",
          uid: "2019012",
          token: ENV['token'],
          name: "Bret Funk")

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
