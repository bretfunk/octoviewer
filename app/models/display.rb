class Display
  attr_reader :current_user
  def initialize(current_user)
    @current_user = current_user
  end

  def self.user_results(current_user)
    GithubService.user_results(current_user)
  end

  def self.starred_results(current_user)
    GithubService.starred_results(current_user)
  end

  def self.events_results(current_user)
    GithubService.events_results(current_user)
  end

  def self.received_events_results(current_user)
    GithubService.received_events_results(current_user)
  end

  def self.orgs_results(current_user)
    GithubService.orgs_results(current_user)
  end

  def self.repos_results(current_user)
    GithubService.orgs_results(current_user)
  end
end
