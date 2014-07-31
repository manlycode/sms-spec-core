module SMS::Spec::Core
  module Helpers
    def last_text_message(search_opts={})
      search_opts.delete_if {|_, val| val.nil? }

      if search_opts.empty?
        MessageCenter.sent.last
      else
        MessageCenter.find(search_opts).last
      end
    end
  end
end
