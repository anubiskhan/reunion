require './lib/activity.rb'

class Reunion
  attr_reader :location, :expenses
  attr_accessor :activities
  def initialize(location)
    @location = location
    reuniting = Activity.new('reuniting')
    @activities = {'reuniting': reuniting}
    @expenses = 0
  end

  def add_activity(activity, cost = 0)
    @expenses += cost.to_f
    @activities[activity] = Activity.new(activity, cost)
  end

  def expenses?
    @expenses
  end
end
