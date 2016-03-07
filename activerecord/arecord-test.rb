require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./arecord.db"
)
ActiveRecord::Base.logger = Logger.new(STDOUT)
Time.zone_default = Time.find_zone! 'Tokyo'

ActiveRecord::Base.default_timezone = :local
class User < ActiveRecord::Base
end

# User.create(name: "sakura", age: 10)
# user = User.where("age > ?",9).first
user = User.find_by_age(10)
p user.name
#p User.all
