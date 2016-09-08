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

  def mytest2
    "mytest2"
  end

  def collect_themes
    
  end

  def count_messege
    
  end


end
