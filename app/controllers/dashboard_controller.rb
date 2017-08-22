class DashboardController < ApplicationController

  def show
    user = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @user_results = JSON.parse(user.body, symbolize_name: true)

    starred = Faraday.get("https://api.github.com/users/#{current_user.nickname}/starred?access_token=#{current_user.token}")
    @starred_results = JSON.parse(starred.body, symbolize_name: true)

    events = Faraday.get("https://api.github.com/users/#{current_user.nickname}/events?access_token=#{current_user.token}")
    @events_results = JSON.parse(events.body, symbolize_name: true)

    received_events = Faraday.get("https://api.github.com/users/#{current_user.nickname}/received_events?access_token=#{current_user.token}")
    @received_events_results = JSON.parse(received_events.body, symbolize_name: true)

    orgs = Faraday.get("https://api.github.com/users/#{current_user.nickname}/orgs?access_token=#{current_user.token}")
    @orgs_results = JSON.parse(orgs.body, symbolize_name: true)

    repos = Faraday.get("https://api.github.com/users/#{current_user.nickname}/repos?access_token=#{current_user.token}")
    @repos_results = JSON.parse(repos.body, symbolize_name: true)
    #byebug
  end
end
