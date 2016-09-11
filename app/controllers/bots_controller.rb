class BotsController < ApplicationController
  before_action :set_bot, only: [:show, :edit, :update, :destroy]

  # GET /bots
  def index
    @bots = Bot.all
  end

  # GET /bots/1
  def show
  end

  # GET /bots/new
  def new
    @bot = Bot.new
  end

  # GET /bots/1/edit
  def edit
    
  end

  # POST /bots
  def create
    begin
      token = bot_params[:token]
      @vk = VkontakteApi::Client.new(token)
      name = @vk.users.get(fields: "photo_100,followers_count").first.to_hash
      friends = @vk.friends.get.count
      requests = @vk.friends.getRequests(v: "5.53").to_hash["count"]
      info = {uid: name["uid"], 
              first_name: name["first_name"],
              last_name: name["last_name"],
              photo: name["photo_100"],
              friends: friends,
              followers: name["followers_count"],
              token: token,
              active: false, 
              requests: requests, 
              token_expired: Time.now + 23 * 3600}

      @bot = Bot.new(info)
      if Bot.where(uid: info[:uid]).count == 0
        @bot.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    rescue => err
      puts err
      redirect_to root_path
    end
  end

  # PATCH/PUT /bots/1
  def update
    hash_params = {token_expired: Time.now + 23 * 3600}
    hash_params[:token] = bot_params[:token]
    if @bot.update(hash_params)
      redirect_to root_path, notice: 'Токен успешно обновлен.'
    else
      redirect_to root_path, notice: 'Токен не был обновлен.'
    end
  end

  # DELETE /bots/1
  def destroy
    @bot.destroy
    redirect_to bots_url, notice: 'Bot was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bot
      @bot = Bot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bot_params
      params.require(:bot).permit(:uid, :first_name, :last_name, :photo, :friends, :followers, :token, :active, :requests, :token_expired)
    end
end
