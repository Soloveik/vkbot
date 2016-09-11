task :test_2, [:param] => :environment do |task, args|
  $redis.set("indicate", "false")
  $redis.set("ping", Bot.find(args[:param]).uid)
end 