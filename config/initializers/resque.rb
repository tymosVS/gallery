# uri = URI.parse("redis://localhost:6379/")  
# Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/" )
REDIS = Redis.new(:url => uri)