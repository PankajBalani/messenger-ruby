module Messenger
  module Elements
    class QuickReply
      attr_accessor :content_type, :title, :payload, :image_url

      def initialize(content_type:,title:, payload:, image_url:)
        @content_type  = content_type
        @title = title
        @image_url = image_url
        @payload = payload
      end

      def build
        { content_type: @content_type, title: @title, payload: @payload, image_url: @image_url}
      end

    end
  end
end
