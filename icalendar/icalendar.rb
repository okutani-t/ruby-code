require 'bundler'
Bundler.require

cal = Icalendar::Calendar.new
cal.event do |e|
  cal.timezone do |t|
    t.tzid = 'Asia/Tokyo'
    t.standard do |s|
      s.tzoffsetfrom = '+0900'
      s.tzoffsetto   = '+0900'
      s.tzname       = 'JST'
      s.dtstart      = '19700101T000000'
    end
  end
  e.dtstart = Icalendar::Values::Date.new('20170731')
  e.dtend = Icalendar::Values::Date.new('20170805')
  e.summary = "Trip!"
  e.description = "フェリーにのって直島にいきます"
  e.ip_class = "PRIVATE"
end

cal.publish
open('trip.ics', 'w') { |f| f.puts(cal.to_ical) }
