page_source = open("samplepage.html", &:read)
dates = page_source.scan(%r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)
p dates[0, 4]

url_titles = page_source.scan(
  %r!^<a href="(.+?)">(.+?)</a><br />!)
p url_titles[0, 4]

# datesとurl_titlesの個数が一致しているかどうか
p dates.length
p url_titles.length

p dates[0, 4].zip(url_titles[0,4])
