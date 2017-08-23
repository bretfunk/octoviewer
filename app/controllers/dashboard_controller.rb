class DashboardController < ApplicationController

  def show
    @user_results = Display.user_results(current_user)
    #user = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    #@user_results = JSON.parse(user.body, symbolize_name: true)
    @starred_results = Display.starred_results(current_user)
    #starred = Faraday.get("https://api.github.com/users/#{current_user.nickname}/starred?access_token=#{current_user.token}")
    #@starred_results = JSON.parse(starred.body, symbolize_name: true)
    #@events_results = Display.events_results(current_user)
    events = Faraday.get("https://api.github.com/users/#{current_user.nickname}/events?access_token=#{current_user.token}")
    @events_results = JSON.parse(events.body, symbolize_name: true)
    #@received_events_results = Display.received_events_results(current_user)
    received_events = Faraday.get("https://api.github.com/users/#{current_user.nickname}/received_events?access_token=#{current_user.token}")
    @received_events_results = JSON.parse(received_events.body, symbolize_name: true)
    @orgs_results = Display.orgs_results(current_user)
    #orgs = Faraday.get("https://api.github.com/users/#{current_user.nickname}/orgs?access_token=#{current_user.token}")
    #@orgs_results = JSON.parse(orgs.body, symbolize_name: true)
    @repos_results = Display.repos_results(current_user)
    #repos = Faraday.get("https://api.github.com/users/#{current_user.nickname}/repos?access_token=#{current_user.token}")
    #@repos_results = JSON.parse(repos.body, symbolize_name: true)
    byebug
  end
end
