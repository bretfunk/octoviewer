class Repo
  attr_reader :name, :url, :created_at

  def initialize(attrs)
    @name = attrs[:name]
    @url = attrs[:html_url]
    @created_at = attrs[:created_at]
  end

  def self.for_user(user)
    repos = GithubService.repos_results(user).map {|raw_repo|
      Repo.new(raw_repo)
    }
    repos.sort_by { |repo| repo.created_at }.reverse
  end
end
