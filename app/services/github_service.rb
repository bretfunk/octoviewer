class GithubService
  attr_reader :conn, :nickname, :token, :current_user

  def initialize(current_user)
    @current_user      = current_user
    @nickname  = current_user.nickname
    @token     = current_user.token
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      #faraday.headers["access_token"] = ENV["#{current_user.token}"]
      faraday.headers["X-API-KEY"] = ENV["#{current_user.token}"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def user_results
    parse(@conn.get("/user?access_token=#{token}"))
  end

  def starred_results
    parse(@conn.get("/users/#{nickname}/starred?access_token=#{token}"))
  end

  def events_results
    parse(@conn.get("/users/#{nickname}/events?access_token=#{token}"))
  end

  def received_events_results
    parse(@conn.get("/users/#{nickname}/received_events?access_token=#{token}"))
  end

  def orgs_results
    parse(@conn.get("/users/#{nickname}/orgs?access_token=#{token}"))
  end

  def repos_results
    parse(@conn.get("/users/#{nickname}/repos?access_token=#{token}"))
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

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
