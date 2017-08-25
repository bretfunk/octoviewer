class Profile
  attr_reader :user_results

  def initialize(user)
    @user_results = GithubService.new(user).user_results
  end
end
