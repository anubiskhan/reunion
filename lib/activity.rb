class Activity
  attr_reader :name, :participants
  def initialize(name, cost = 0)
    @name = name
    @participants = []
    @cost = cost.to_f
  end

  def add_participants(person)
    @participants.push(person)
  end

  def total_cost?
    @cost * @participants.length
  end
end
