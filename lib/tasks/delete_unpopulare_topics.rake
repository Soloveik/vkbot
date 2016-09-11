task :delete_unpopulare_topics, [:param] => :environment do |task, args|
  @vk = VkontakteApi::Client.new(Bot.find(args[:param]).token)
  Theme.all.each do |theme|
    begin
      if @vk.board.getComments(group_id: theme.gid, topic_id: theme.tid, count: 100).to_hash["comments"].first.to_i < 2000
        theme.delete
      end
    rescue => err
      puts err
    end
    sleep 0.35
  end
  $redis.set("indicate", "false")
end