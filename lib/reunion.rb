require './lib/activity.rb'

class Reunion
  attr_reader :location
  attr_accessor :activities
  def initialize(location)
    @location = location
    reuniting = Activity.new('reuniting')
    @activities = [reuniting]
  end

  def add_activity(activity, cost = 0)
    @activities.push(Activity.new(activity, cost))
  end
end
