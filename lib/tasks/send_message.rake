task :send_message, [:param] => :environment do |task, args| 
  
  @vk = VkontakteApi::Client.new(Token.first.token)
  
  Theme.all.each do |numbers|
    begin
      @vk.board.createComment(group_id: numbers.gid, topic_id: numbers.tid, message: "Добавляйтесь в друзья, поиграем!")
      puts "complete - " + numbers.gid.to_s
    rescue => err
      puts err
    end
    sleep 3
  end

end



