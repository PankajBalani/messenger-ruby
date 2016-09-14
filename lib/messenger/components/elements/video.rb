require 'messenger/components/attachment'

module Messenger
  module Elements
    class Video
      include Components::Attachment

      attr_accessor :url

      ATTRIBUTES = %w(url).freeze

      def initialize(url:)
        @url  = url
        @type = 'video'
      end
    end
  end
end
