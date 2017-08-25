class Profile
  attr_reader :user_results,
              :starred_results,
              :events_results,
              :received_events_results,
              :orgs_results,
              :repos_results

  def initialize(user)
    @user_results              = GithubService.new(user).user_results
    @starred_results           = GithubService.new(user).starred_results
    @events_results            = GithubService.new(user).events_results
    @received_events_results   = GithubService.new(user).received_events_results
    @orgs_results              = GithubService.new(user).orgs_results
    @repos_results             = GithubService.new(user).repos_results
  end
end
