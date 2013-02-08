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
    @sergioThoughts = [
      "He's awesome!", 
      "He's the best!", 
      "Just let go and let the magic happen."
    ]
    @julieThoughts = [
      "She's nice!", 
      "Her face is round.", 
      "She really likes purple...and chocolate."
    ]
    @christineThoughts = [
      "I don't like her.", 
      "Is she around, I don't want her to mace me.", 
      "She's a tele-tubby."]
    @otherThoughts = [
      "They're ok.", 
      "Eh, I don't know them that well.", 
      "Are they the one who...nevermind I won't get into that."
    ]
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

  listen_for /(what|how).+you (think|like)( ?of)? (.*)/i do |a,b,c,name|
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

  listen_for /(tell|have|say) .*joke/i do
    sayFromArray @christineJokes
    request_completed
  end
end
