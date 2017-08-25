class Event
  attr_reader :image, :login, :repo, :type

  def initialize(attrs)
    @image = attrs[:actor][:avatar_url]
    @login = attrs[:actor][:display_login]
    @repo  = attrs[:repo][:name]
    @type  = attrs[:type]
  end

 def self.for_user(user)
   GithubService.events_results(user).map { |raw_event|
     Event.new(raw_event)
   }
 end
end
