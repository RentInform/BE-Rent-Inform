require 'redis'

$redis = Redis.new(url: ENV["REDIS_URL"], password: ENV["REDIS_PASSWORD"])
