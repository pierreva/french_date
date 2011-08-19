require './helper'
# P.L.V. 19/08/2011
# Using /Users/pierreva/.rvm/gems/ruby-1.9.2-p180
require 'minitest/autorun'
# date_french = "22/vent/02" # 1794-03-12
# date_french = "13/germ/02" # 1794-04-02
# date_french = "03/prai/02" # 1794-05-22
# date_french = "26/brum/03" # 1794-11-16
# date_french = "02/comp/06" # 1798-09-18
class TestFrenchDate   < MiniTest::Unit::TestCase
  def test_french_date_convert
    assert_equal("1794-03-12", french_to("22/vent/02").to_s)
    assert_equal("1794-04-02", french_to("13/germ/02").to_s)
    assert_equal("1794-05-22", french_to("03/prai/02").to_s)
    assert_equal("1794-11-16", french_to("26/brum/03").to_s)
    assert_equal("1798-09-18", french_to("02/comp/06").to_s)
  end
end