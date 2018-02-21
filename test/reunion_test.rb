require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_reunion_has_location
    reunion = Reunion.new('Degoba')

    assert_instance_of Reunion, reunion
    assert_equal 'Degoba', reunion.location
  end

  def test_that_reunion_has_activities
    reunion = Reunion.new('Degoba')

    assert_instance_of Hash, reunion.activities
    assert_instance_of Activity, reunion.activities[:reuniting]
    assert_equal 'reuniting', reunion.activities[:reuniting].name
  end

  def test_activities_can_be_added_to_reunion
    reunion = Reunion.new('Degoba')

    reunion.add_activity('jedi mind tricks')
    reunion.add_activity('kinda meeting dad')
    reunion.add_activity('swamp stuffs', 400)

    assert_equal 'jedi mind tricks', reunion.activities['jedi mind tricks'].name
    assert_equal 'kinda meeting dad', reunion.activities['kinda meeting dad'].name
    assert_equal 'swamp stuffs', reunion.activities['swamp stuffs'].name
    assert_equal 400.0, reunion.activities['swamp stuffs'].cost?
    assert_equal 4, reunion.activities.length
  end

  def test_can_determine_entire_reunion_cost
    reunion = Reunion.new('Degoba')

    reunion.add_activity('jedi mind tricks', 12)
    reunion.add_activity('kinda meeting dad', 18.42)
    reunion.add_activity('swamp stuffs', 400)

    assert_equal 430.42, reunion.expenses?
  end

  # def test_can_determine_all_reunion_attendees
  #   reunion = Reunion.new('Degoba')
  #
  #   reunion.add_activity('jedi mind tricks', 12)
  #   reunion.add_activity('kinda meeting dad', 18.42)
  #   reunion.add_activity('swamp stuffs', 400)
  #
  #
  # end
end
