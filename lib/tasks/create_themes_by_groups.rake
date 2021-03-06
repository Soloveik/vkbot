    task :create_themes_by_groups, [:param] => :environment do |task, args| 
      @vk = VkontakteApi::Client.new(Bot.find(args[:param]).token)
      data = @vk.groups.search(q: "игра", count: 1000, sort: 2)
      data = data.map{|e| e.to_hash["gid"] if e != data[0]}.compact
      data.each do |id|
        begin
          theme = @vk.board.getTopics(group_id: id).to_hash["topics"]#.map{|t| t.to_}
          theme.shift
          theme.each do |th|
            if Theme.where(gid: id, theme: th["title"], tid: th["tid"]).count == 0
              Theme.create(gid: id, theme: th["title"], tid: th["tid"])  if th["title"].scan("друз").count != 0
            end
          end
        rescue => err
          puts err
        end
        sleep 0.5
      end
      $redis.set("indicate", "false")
    end