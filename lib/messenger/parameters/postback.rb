module Messenger
  module Parameters
    class Postback
      include Callback

      attr_accessor :payload

      def initialize(payload:,title: 'dummy')
        @payload = payload
        @title = title
      end
    end
  end
end
