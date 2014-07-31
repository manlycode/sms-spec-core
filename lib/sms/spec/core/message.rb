module SMS::Spec::Core
  class Message
    CHARACTER_LIMIT = 140

    attr_reader :body, :from, :to

    def initialize(opts={})
      self.body = opts[:body]
      self.to = opts[:to]
      self.from = opts[:from]
    end

    def body=(text)
      if text.size > CHARACTER_LIMIT
        raise %(The message: \n "#{text}"\n\n contains (#{text.size}/#{CHARACTER_LIMIT}) characters)
      end

      @body = text
    end

    def to=(num_string)
      @to = parse_number(num_string)
    end

    def from=(num_string)
      @from = Phoner::Phone.parse(num_string)
    end

    private

    def parse_number(num_string)
      Phoner::Phone.parse(num_string).tap do |parsed_number|
        raise %(Could not parse the phone number: "#{num_string}") if parsed_number.nil?
      end
    end
  end
end
