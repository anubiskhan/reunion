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

    assert_instance_of Array, reunion.activities
    assert_instance_of Activity, reunion.activities[0]
    assert_equal 'reuniting', reunion.activities[0].name
  end

  def test_activities_can_be_added_to_reunion
    reunion = Reunion.new('Degoba')

    reunion.add_activity('jedi mind tricks')
    reunion.add_activity('kinda meeting dad')
    reunion.add_activity('swamp stuffs', 400)

    assert_equal 'jedi mind tricks', reunion.activities[1].name
    assert_equal 'kinda meeting dad', reunion.activities[2].name
    assert_equal 'swamp stuffs', reunion.activities[3].name
    assert_equal 400.0, reunion.activities[3].cost?
    assert_equal 4, reunion.activities.length
  end
end
