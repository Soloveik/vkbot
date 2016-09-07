class ManagersController < ApplicationController

  require "hashie"

  require 'rake'

  Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
  Vkbot::Application.load_tasks # providing your application name is 'sample'

  def index
    @bots = Bot.all
  end

  def mytest1
    "mytest1"
  end

  def mytest2
    "mytest2"
  end

  def collect_themes
    
  end

  def count_messege
    
  end


end
