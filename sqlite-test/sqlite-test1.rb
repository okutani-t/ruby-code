require 'dbi'

dbh = DBI.connect('DBI:SQLite3:into-text.sqlite3')
name = []
dbh.select_all('select name from users') do |row|
  name << row[0]
end
p name
dbh.disconnect
