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
    @sergioThoughts = ["He's awesome!"]
    @julieThoughts = ["She's nice!"]
    @christineThoughts = ["I don't like her."]
    @otherThoughts = ["They're ok."]
    @christineJokes = [
      "Christine's face.", 
      "Why did the chicken cross the road? It saw Christine's face.",
      "Did you hear the one about Christine's face?"
    ]
  end

  def sayFromArray(array) 
    thought = array.pop
    array.push thought
    say thought
  end

  listen_for /what do you think of (.*)/i do |name|
    if name =~ /sergio/i then
      sayFromArray @sergioThoughts
    elsif name =~ /julie/i then
      sayFromArray @julieThoughts
    elsif name =~ /christine/i then
      sayFromArray @christineThoughts
    else
      sayFromArray @otherThoughts
    end

    request_completed 
  end

  listen_for /joke/i do
    sayFromArray @christineJokes
    request_completed
  end
end
