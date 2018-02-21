require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_activity_can_have_name
    activity = Activity.new('coding')

    assert_equal 'coding', activity.name
  end

  def test_activity_can_have_participants
    activity = Activity.new('coding')

    activity.add_participants('Doug')

    assert activity.participants.include?('Doug')

    activity.add_participants('Judy')
    activity.add_participants('Jake')

    assert_equal 3, activity.participants.length
  end
end
