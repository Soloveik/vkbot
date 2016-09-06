task :ping, [:param] => :environment do |task, args| 
  @vk = VkontakteApi::Client.new(Token.first.token)
  data = @vk.groups.search(q: "игра", count: 1000, sort: 2)
      
  puts data.inspect
  puts "its ok"
end



