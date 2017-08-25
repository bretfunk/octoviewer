class Org
  attr_reader :login

  def initialize(attrs)
    @login = attrs[:login]
  end

  def self.for_user(user)
    GithubService.orgs_results(user).map { |raw_org|
      Org.new(raw_org)
    }
  end
end
