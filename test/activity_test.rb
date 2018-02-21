require 'pry'
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

  def test_activity_has_a_cost
    activity = Activity.new('movie', 12)
    activity.add_participants('Doug')

    assert_equal 12, activity.cost?
    assert_instance_of Float, activity.cost?
  end

  def test_activity_has_a_different_cost
    activity = Activity.new('Ride to space', 100_000)
    activity.add_participants('Doug')
    activity.add_participants('Judy')

    assert_equal 100_000, activity.cost?
  end

  def test_activity_cost_can_be_split
    activity = Activity.new('movie', 36)
    activity.add_participants('Doug')
    activity.add_participants('Judy')
    activity.add_participants('Jake')

    assert_equal 36, activity.cost?
    assert_equal 12, activity.cost_per_person?
  end

  def test_participants_can_make_payments
    activity = Activity.new('movie', 36)
    activity.add_participants('Doug')
    activity.add_participants('Judy')
    activity.add_participants('Jake')

    activity.make_payment('Doug', 12)
    activity.make_payment('Judy', 0)
    activity.make_payment('Jake', 24)

    assert_equal 12, activity.accounts['Doug']
    assert_equal 0, activity.accounts['Judy']
    assert_equal 24, activity.accounts['Jake']
    assert_instance_of Float, activity.accounts['Jake']
  end

  def test_can_determine_who_owes_what
    activity = Activity.new('movie', 36)
    activity.add_participants('Doug')
    activity.add_participants('Judy')
    activity.add_participants('Jake')

    activity.make_payment('Doug', 12)
    activity.make_payment('Judy', 0)
    activity.make_payment('Jake', 24)

    assert_equal [{'Doug'=>0.0}, {'Judy'=>12.0}, {'Jake'=>(-12.0)}], activity.who_owes?
  end
end
