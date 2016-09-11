class ManagersController < ApplicationController

  require "hashie"

  require 'rake'

  Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
  Vkbot::Application.load_tasks # providing your application name is 'sample'

  def index
    @bots = Bot.all
  end

  def bot_activation
    begin 
      token = params[:tok]
      vk = VkontakteApi::Client.new(token)
      name = vk.users.get(fields: "photo_100,followers_count").first.to_hash
      friends = vk.friends.get.count
      requests = vk.friends.getRequests(v: "5.53").to_hash["count"]
      info = {uid: name["uid"], 
              first_name: name["first_name"],
              last_name: name["last_name"],
              photo: name["photo_100"],
              friends: friends,
              followers: name["followers_count"],
              token: token,
              active: false, 
              requests: requests} 
      @bot = Bot.where(uid: info[:uid]).first
      @bot.update_attributes(info) unless @bot.nil?
      @ind = "/green.png"
    rescue => err
      @ind = "/red.png"
      puts err
    end  
    
  end

  def test_1
    Thread.new {
      Rake::Task["test_1"].reenable # in case you're going to invoke the same task second time.
      Rake::Task["test_1"].invoke(params[:id])
      # Rake.application.invoke_task("test_1[#{params[:id]}]")
    }
    # redirect_to root_path
  end

  def test_2
    if $redis[:indicate] == "false"
      $redis.set("indicate", "true")
        Thread.new {
          system "rake test_2[#{params[:id]}]"
        }
    else
      @err = "Ошибка. Запущена таска - #{$redis.get("name_task")}"
    end
    redirect_to root_path
  end

  def create_themes_by_groups
    if $redis[:indicate] == "false"
      $redis.set("indicate", "true")
        Thread.new {
          system "rake create_themes_by_groups[#{params[:id]}]"
        }
    else
      @err = "Ошибка. Запущена уже таска"
    end
    redirect_to root_path
  end

  def delete_unpopulare_topics
     if $redis[:indicate] == "false"
      $redis.set("indicate", "true")
        Thread.new {
          system "rake delete_unpopulare_topics[#{params[:id]}]"
        }
    else
      @err = "Ошибка. Запущена уже таска"
    end  
    redirect_to root_path  
  end

  def send_message
    if $redis[:indicate] == "false"
      $redis.set("indicate", "true")
        Thread.new {
          system "rake send_message[#{params[:id]}]"
        }
    else
      @err = "Ошибка. Запущена уже таска"
    end
    redirect_to root_path  
  end

  def to_accept_requests
    if $redis[:indicate] == "false"
      $redis.set("indicate", "true")
        Thread.new {
          system "rake to_accept_requests[#{params[:id]}]"
        }
    else
      @err = "Ошибка. Запущена уже таска"
    end
    redirect_to root_path
  end

  def count_messege
    
  end


end
