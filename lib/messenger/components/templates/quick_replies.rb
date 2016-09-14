module Messenger
  module Templates
    class QuickReplies

      attr_accessor :text, :quick_replies

      ATTRIBUTES = %w(text quick_replies).freeze

      def initialize(text:, quick_replies:)
        @text          = text
        @quick_replies = build_quick_replies(quick_replies)
      end

      def build_quick_replies(quick_replies)
        quick_replies.map { |quick_reply| quick_reply.build } if quick_replies.present?
      end

      def build
        {text: @text, quick_replies: @quick_replies}
      end
    end
  end
end