require File.dirname(__FILE__) + '/test_helper.rb'

class TestEntry < Test::Unit::TestCase
  def test_that_it_does_not_parse_comments
    assert_equal(true, CronWTF::Entry.new('# * * * * *').is_comment)
  end
  
  def test_that_it_parses_command
    assert_equal('foo bar baz > wat', CronWTF::Entry.new("1 1,2 3-4 */5 * foo bar baz > wat").command)
  end

  def test_that_it_parses_infinite_minutes
    assert_equal('*', CronWTF::Entry.new("* * * *  * foo").minutes)
  end
  
  def test_that_it_parses_minute
    assert_equal([1], CronWTF::Entry.new("1 * * *  * bar").minutes)
  end
  
  def test_that_it_parses_minute_list
    assert_equal([1,2], CronWTF::Entry.new("1,2 * * *  * bar").minutes)
  end
  
  def test_that_it_parses_minute_range
    assert_equal([1,2,3,4,5], CronWTF::Entry.new("1-5 * * *  * bar").minutes)
  end
  
  def test_that_it_parses_minute_step
    assert_equal([0,10,20,30,40,50], CronWTF::Entry.new("*/10 * * *  * bar").minutes)
  end

  def test_that_it_parses_infinite_hours
    assert_equal('*', CronWTF::Entry.new("1 * * *  * foo").hours)
  end
  
  def test_that_it_parses_hour
    assert_equal([1], CronWTF::Entry.new("2 1 * *  * bar").hours)
  end
  
  def test_that_it_parses_hour_list
    assert_equal([1,2], CronWTF::Entry.new("1 1,2 * *  * bar").hours)
  end
  
  def test_that_it_parses_hour_range
    assert_equal([1,2,3,4,5], CronWTF::Entry.new("1 1-5 * *  * bar").hours)
  end
  
  def test_that_it_parses_hour_step
    assert_equal([0,3,6,9,12,15,18,21], CronWTF::Entry.new("1 */3 *  * bar").hours)
  end

  def test_that_it_parses_infinite_days
    assert_equal('*', CronWTF::Entry.new("1 2 * *  * foo").days)
  end
  
  def test_that_it_parses_day
    assert_equal([1], CronWTF::Entry.new("2 2 1 *  * bar").days)
  end
  
  def test_that_it_parses_day_list
    assert_equal([1,2], CronWTF::Entry.new("1 1 1,2 *  * bar").days)
  end
  
  def test_that_it_parses_day_range
    assert_equal([1,2,3,4,5], CronWTF::Entry.new("1 1 1-5 *  * bar").days)
  end
  
  def test_that_it_parses_day_step
    assert_equal([0,3,6,9,12,15,18,21,24,27,30], CronWTF::Entry.new("1 1 */3 *  * bar").days)
  end

  def test_that_it_parses_infinite_months
    assert_equal('*', CronWTF::Entry.new("1 2 3 *  * foo").months)
  end
  
  def test_that_it_parses_month
    assert_equal([1], CronWTF::Entry.new("2 2 2 1  * bar").months)
  end
  
  def test_that_it_parses_month_list
    assert_equal([1,2], CronWTF::Entry.new("1 1 1 1,2  * bar").months)
  end
  
  def test_that_it_parses_month_range
    assert_equal([1,2,3,4,5], CronWTF::Entry.new("1 1 1 1-5  * bar").months)
  end
  
  def test_that_it_parses_month_step
    assert_equal([0,3,6,9], CronWTF::Entry.new("1 1 1 */3  * bar").months)
  end

  def test_that_it_parses_infinite_week_days
    assert_equal('*', CronWTF::Entry.new("1 2 3 4 * foo").week_days)
  end
  
  def test_that_it_parses_week_day
    assert_equal([1], CronWTF::Entry.new("2 2 2 2 1 bar").week_days)
  end
  
  def test_that_it_parses_week_day_list
    assert_equal([1,2], CronWTF::Entry.new("1 1 1 1 1,2 bar").week_days)
  end
  
  def test_that_it_parses_week_day_range
    assert_equal([1,2,3,4,5], CronWTF::Entry.new("1 1 1 1 1-5 bar").week_days)
  end
  
  def test_that_it_parses_week_day_step
    assert_equal([0,3,6], CronWTF::Entry.new("1 1 1 1 */3 bar").week_days)
  end
end