# feb 13 07 P.L.V.
# aug 19 11 test with ruby 1.9.2
module FrenchDate
  require 'date'
  #require 'parsedate' ruby 1.9.2
  # d = Date.new(1791, 9, 22)
  # d.jd => 2375474
  SDN_OFFSET  = 2375474
  DAYS_PER_MONTH  = 30
  DAYS_PER_4_YEARS =  1461
  SDN_OFFSET_GREGOR = 32045
  DAYS_PER_5_MONTHS = 153
  DAYS_PER_400_YEARS = 146097
  
  def convert(y, m, d)
    sdn = (y*DAYS_PER_4_YEARS/4) + (m-1)*DAYS_PER_MONTH + d + SDN_OFFSET
  #  puts sdn
    temp = (sdn + SDN_OFFSET_GREGOR) * 4 - 1
    # Calculate the century (year/100). 
    century = temp / DAYS_PER_400_YEARS
    # Calculate the year and day of year (1 <= dayOfYear <= 366).
    temp = ((temp % DAYS_PER_400_YEARS) / 4) * 4 + 3
    year = (century * 100) + (temp / DAYS_PER_4_YEARS)
    dayOfYear = (temp % DAYS_PER_4_YEARS) / 4 + 1
  #  puts dayOfYear
    # Calculate the month and day of month. 
    temp = dayOfYear * 5 - 3
    month = temp / DAYS_PER_5_MONTHS
    day = (temp % DAYS_PER_5_MONTHS) / 5 + 1
    # Convert to the normal beginning of the year. 
    if (month < 10) 
      month += 3
    else 
      year += 1
      month -= 9
    end
    # Adjust to the B.C./A.D. type numbering. 
    year -= 4800
    return year, month, day
  end
  def french_to(date_french)
    french_month = {'vend' => 1, 'brum' => 2, 'frim'=> 3, 'nivo' => 4, 'pluv' => 5, 'vent' => 6,'germ' => 7, 'flor' => 8, 'prai' => 9, 'mess' => 10, 'ther' => 11, 'fruc' => 12, 'comp' => 13}
    d = date_french[0,2]
    m = date_french[3,4]
    month = french_month[m]
    y = date_french[8,2]
    year, month, day = convert(y.to_i, month.to_i, d.to_i)
    date = Date.new(year, month, day)
    return date
  end
  def str_to_date(datestr)
  	y, d, m = ParseDate::parsedate(datestr)
  	date = Date.new(y, m, d)
  	return date
  end
# date_french = "22/vent/02" # 1794-03-12
# date_french = "13/germ/02" # 1794-04-02
# date_french = "03/prai/02" # 1794-05-22
# date_french = "26/brum/03" # 1794-11-16
# date_french = "02/comp/06" # 1798-09-18
end