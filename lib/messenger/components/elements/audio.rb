require 'messenger/components/attachment'

module Messenger
  module Elements
    class Audio
      include Components::Attachment

      attr_accessor :url

      ATTRIBUTES = %w(url).freeze

      def initialize(url:)
        @url  = url
        @type = 'image'
      end
    end
  end
end
