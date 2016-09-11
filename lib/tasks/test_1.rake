task :test_1, [:param] => :environment do |task, args|
  10.times do |i|
    puts "task 1 second is #{i}"
    sleep 1
  end
  puts args[:param]
end