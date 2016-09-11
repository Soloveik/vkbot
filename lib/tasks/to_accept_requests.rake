task :to_accept_requests, [:param] => :environment do |task, args|
  vk = VkontakteApi::Client.new(Bot.find(args[:param]).token)
  req = vk.friends.getRequests
  req.each do |id|
    begin 
    vk.friends.add(user_id: id)
    rescue => err
    puts err
    end
  sleep 0.5
  end
  $redis.set("indicate", "false")
end