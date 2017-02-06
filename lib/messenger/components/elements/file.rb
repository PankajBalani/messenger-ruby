require 'messenger/components/attachment'

module Messenger
  module Elements
    class File
      include Components::Attachment

      attr_accessor :url

      ATTRIBUTES = %w(url).freeze

      def initialize(url:)
        @url  = url
        @type = 'file'
      end
    end
  end
end
