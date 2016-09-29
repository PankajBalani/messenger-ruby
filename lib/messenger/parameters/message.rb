module Messenger
  module Parameters
    class Message
      include Callback

      attr_accessor :mid, :seq, :text, :attachments, :quick_reply, :app_id, :is_echo

      def initialize(mid:, seq:, text: nil, attachments: nil, quick_reply: nil, is_echo: nil, app_id: nil)
        @quick_reply = quick_reply if quick_reply.present?
        @app_id      = app_id if app_id.present?
        @is_echo     = is_echo if is_echo.present?
        @mid         = mid
        @seq         = seq
        @text        = text if text.present?
        @attachments = build_attachments(attachments) if attachments.present?
      end

      def build_attachments(attachments)
        attachments.map { |attachment| Attachment.new(attachment.symbolize_keys.slice(:type, :payload)) }
      end
    end
  end
end