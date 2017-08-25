class ReceivedEvent
  attr_reader :pic, :login, :repo, :type

  def initialize(attrs)
    @pic = attrs[:actor][:avatar_url]
    @login = attrs[:actor][:display_login]
    @repo = attrs[:repo][:name]
    @type = attrs[:type]
  end

  def self.for_user(user)
    GithubService.received_events_results(user).map do |raw_events|
      ReceivedEvent.new(raw_events)
    end
  end
end
