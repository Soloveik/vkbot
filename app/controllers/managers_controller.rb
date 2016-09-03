class ManagersController < ApplicationController
  require "hashie"

  def index
    # @vk = VkontakteApi::Client.new(Token.first.token)
    # # @vk.token = Token.first.token
    # data = @vk.users.get.first.to_hash
    # @data = data.inspect
  end
end
