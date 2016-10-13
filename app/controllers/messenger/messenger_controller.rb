require 'rest-client'

module Messenger
  class MessengerController < ActionController::Base

    before_action :set_page_access_token

    def validate
      if verify_token_valid? && access_token_valid?
        render json: params["hub.challenge"]
      elsif !verify_token_valid?
        render json: 'Invalid verify token'
      else
        render json: 'Invalid page access token'
      end
    end

    def subscribe
      render json: activate_bot
    rescue RestClient::BadRequest
      render json: 'Invalid page access token'
    end

    private

    def app_location
      "https://graph.facebook.com/v2.6/me/subscribed_apps?access_token=#{Messenger.config.page_access_token}"
    end

    def activate_bot
      RestClient.post(app_location, nil)
    end

    def access_token_valid?
      JSON.parse(RestClient.get(app_location)).key?('data')
    rescue RestClient::BadRequest
      return false
    end

    def verify_token_valid?
      params["hub.verify_token"] == Messenger.config.verify_token
    end

    def fb_params
      Params.new(params)
    end

    def set_page_access_token
      #recipient_id = params[:entry][0][:id] 
      #@facebook_token = BotConfig.where(recipient_id: recipient_id).first
      @facebook_token = BotConfig.where(page_slug: params[:slug]).first
      Messenger.configure do |config|
        config.verify_token      = @facebook_token.verify_token
        config.page_access_token = @facebook_token.page_access_token
      end
    end
  end
end
