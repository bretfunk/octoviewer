require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github" do
    visit root_path
    stub_omniauth

    expect(page.status_code).to eq(200)
    expect(current_path).to eq(root_path)

    expect(page).to have_link("Login")
    click_link "Login"

    expect(current_path).to eq(user_path)
    expect(page).to have_content("Bret Funk")

  end
end