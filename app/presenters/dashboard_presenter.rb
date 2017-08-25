class DashboardPresenter
  def initialize(user)
    @user = user
  end

  def starred_repos_count
    GithubService.starred_results(user).count
  end

  def repos
    Repo.for_user(user)
  end

  private
  attr_reader :user
end
