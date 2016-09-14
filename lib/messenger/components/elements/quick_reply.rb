module Messenger
  module Elements
    class QuickReply
      attr_accessor :content_type, :title, :payload

      def initialize(title:, payload:)
        @content_type  = 'text'
        @title = title
        @payload = payload
      end

      def build
        { content_type: @content_type, title: @title, payload: @payload }
      end

    end
  end
end
