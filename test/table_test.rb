require File.dirname(__FILE__) + '/test_helper.rb'

class TestTable < Test::Unit::TestCase
  def test_that_it_parses_multiple_lines
    assert_table(["Runs `foo` every minute.", "Runs `bar` every minute."], "* * * * * foo\n* * * * * bar")
  end
  
  def test_that_it_parses_mixed_whitespace
    assert_table(["Runs `foo` every minute."], "\n 	*   * 	* * * foo	 \n\n")
  end

  def test_that_it_ignores_comments
    assert_table([], "# mm hh jj MMM JJJ\n \n")
  end

  def test_that_it_parses_10_minute_cron
    assert_table(["Runs `foo` at minutes :00, :10, :20, :30, :40, :50, every hour."], "*/10 * * * * foo")
  end

  def test_that_it_parses_6_hour_cron
    assert_table(["Runs `foo` at minute :00, on hours 0, 6, 12, 18, every day."], "0 */6 * * * foo")
  end
  
  def test_that_it_parses_by_daily_cron
    assert_table(["Runs `foo` at minute :00, on hour 0, on days 0, 10, 20, 30, every month."], "0 0 */10 * * foo")
  end

  def test_that_it_parses_seasonal_cron
    assert_table(["Runs `foo` at minute :00, on hour 0, every day, in Jan, Feb, Mar, Dec, every week day."], "0 0 * 0,1,2,11 * foo")
  end

  def test_that_it_parses_seasonal_cron_on_certain_week_days
    assert_table(["Runs `foo` at minute :00, on hour 0, every day, in Jan, Feb, Mar, Dec, on Mon, Wed, Fri."], "0 0 * 0,1,2,11 1,3,5 foo")
  end
  
  def assert_table(expected, input)
    assert_equal(expected.join("\n"), CronWTF::Table.new(input).to_s)
  end
end
