require 'cora'
require 'siri_objects'
require 'pp'

#######
# This is a "hello world" style plugin. It simply intercepts the phrase "test siri proxy" and responds
# with a message about the proxy being up and running (along with a couple other core features). This
# is good base code for other plugins.
#
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::Test < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  listen_for /what do you think of (.*)/i do |name|
    if name =~ /sergio/i then
      say "He's awesome!"
    elsif name =~ /julie/i then
      say "She's nice!"
    elsif name =~ /christine/i then
      say "I don't like her."
    else
      say "They're ok."
    end

    request_completed 
  end

  listen_for /joke/i do
    jokes = [
      "Christine's face.", 
      "Why did the chicken cross the road? It saw Christine's face.",
      "Did you hear the one about Christine's face?"
    ]

    say jokes.sample
  end
end
