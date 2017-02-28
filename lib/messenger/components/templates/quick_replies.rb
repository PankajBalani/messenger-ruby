module Messenger
  module Templates
    class QuickReplies

      attr_accessor :text, :quick_replies

      ATTRIBUTES = %w(text quick_replies).freeze

      def initialize(text:, quick_replies:, attachment:)
        @text          = text
        @attachment = attachment
        @quick_replies = build_quick_replies(quick_replies)
      end

      def build_quick_replies(quick_replies)
        quick_replies.map { |quick_reply| quick_reply.build } if quick_replies.present?
      end

      def build
        if @text
          {text: @text , quick_replies: @quick_replies}
        elsif @attachment
          {attachment: @attachment[:attachment], quick_replies: @quick_replies}
        end
      end
    end
  end
end