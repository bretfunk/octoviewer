class GithubService
  attr_reader :conn, :nickname, :token, :current_user

  def initialize(current_user)
    @current_user      = current_user
    @nickname  = current_user.nickname
    @token     = current_user.token
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.authorization :Token, @current_user.token
      faraday.adapter Faraday.default_adapter
    end
  end

  def user_results
    parse(@conn.get("/user"))
  end

  def starred_results
    parse(@conn.get("/users/#{nickname}/starred"))
  end

  def events_results
    parse(@conn.get("/users/#{nickname}/events"))
  end

  def received_events_results
    parse(@conn.get("/users/#{nickname}/received_events"))
  end

  def orgs_results
    parse(@conn.get("/users/#{nickname}/orgs"))
  end

  def repos_results
    parse(@conn.get("/users/#{nickname}/repos"))
  end

  def create_repo(repo_name)
    repo_hash = {name: repo_name}
    #parse(@conn.post("/users#{nickname}/repos?name=#{repo_name}"))
    @conn.post do |req|
      req.url "/user/repos"
      req.headers['Authorization'] = "token #{current_user.token}"
      req.headers['Content-Type'] = 'application/json'
      req.body = repo_hash.to_json
    end
  end

  def self.user_results(current_user)
    new(current_user).user_results
  end

  def self.starred_results(current_user)
    new(current_user).starred_results
  end

  def self.events_results(current_user)
    new(current_user).events_results
  end

  def self.received_events_results(current_user)
    new(current_user).received_events_results
  end

  def self.orgs_results(current_user)
    new(current_user).orgs_results
  end

  def self.repos_results(current_user)
    new(current_user).repos_results
  end

  def self.create_repo(current_user, repo_name)
    new(current_user).create_repo(repo_name)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
