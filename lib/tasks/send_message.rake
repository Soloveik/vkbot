task :send_message, [:param] => :environment do |task, args| 
  @vk = VkontakteApi::Client.new(Bot.find(args[:param]).token)
  Theme.all.each do |numbers|
    begin
      @vk.board.createComment(group_id: numbers.gid, topic_id: numbers.tid, message: ["Добавляйтесь", "добавляйтесь", "добавляемся в друзья"].shuffle.first)
      puts "complete - " + numbers.gid.to_s
    rescue => err
      puts err
    end
    sleep 3
  end
  $redis.set("indicate", "false")
end



