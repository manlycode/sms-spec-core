require "bundler/setup"
Bundler.setup

require "phone"
Phoner::Phone.default_country_code = "1"

require "sms/spec/core/version"
require "sms/spec/core/message"

module SMS::Spec
  module Core
    # SMS::Spec::Core
    # Helps you test your sms messages in applications
    # SMSSpecCore should not be used directly, it should be used
    # as a dependency for packages like "sms-spec-twili"
  end
end
