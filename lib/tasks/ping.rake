task :ping, [:param] => :environment do |task, args| 
  $redis.set("ping", "1")
end



