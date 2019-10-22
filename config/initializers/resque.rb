if Rails.env.production?
  uri = URI.parse(ENV['REDIS_URL'])  
else
  uri = URI.parse("redis://localhost:6379/")  
end
Resque.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
