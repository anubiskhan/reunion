class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = []
  end

  def add_participants(person)
    @participants.push(person)
  end
end
