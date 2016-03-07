
require 'dbi'

dbh = DBI.connect('DBI:SQLite3:test.sqlite3')
noun = 'okutani'
t = 'age'
sql = "select #{t} from users where name = '#{noun}'"
dbh.select_all(sql) do |line|
  puts line[0]
end
dbh.disconnect
