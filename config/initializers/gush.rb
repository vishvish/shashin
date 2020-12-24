Gush.configure do |config|
  config.redis_url = "redis://localhost:6379"
  config.concurrency = 5
  config.ttl = 3600*24*7
end

# Redis.exists_returns_integer =  true