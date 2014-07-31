require "singleton"

module SMS::Spec::Core
  class MessageCenter
    include Singleton

    attr_reader :sent, :received

    class << self
      extend Forwardable
      def_delegators :instance, :add_sent, :sent, :received

      def find(opts={})
        to = Phoner::Phone.parse(opts[:to])

        instance.sent.select do |message|
          message.to == to
        end
      end
    end

    def initialize
      @sent = []
      @received = []
    end

    def add_sent(opts)
      @sent << Message.new(opts)
    end
  end
end
