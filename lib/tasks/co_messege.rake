task :co_messege, [:param] => :environment do |task, args|
  @vk = VkontakteApi::Client.new(Token.first.token)
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
end