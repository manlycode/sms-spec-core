describe SMS::Spec::Core::Helpers do
  include SMS::Spec::Core::Helpers

  before do
    SMS::Spec::Core::MessageCenter.add_sent(
      to: "616-555-8837",
      from: "616-555-8856",
      body: "what ru doing?"
    )

    SMS::Spec::Core::MessageCenter.add_sent(
      to: "616-555-8856",
      from: "616-555-8837",
      body: "ONOTHING"
    )
  end

  describe "last_text_message" do
    describe "no options" do
      let(:message) { last_text_message }

      it "returns the last sent message" do
        expect(message.to.to_s).to eq("+16165558856")
        expect(message.from.to_s).to eq("+16165558837")
        expect(message.body).to eql("ONOTHING")
      end
    end

    describe "with 'to' option" do
      let(:message) { last_text_message(to: "616-555-8837") }

      it "returns the last sent message to the given phone number" do
        expect(message.to.to_s).to eq("+16165558837")
        expect(message.from.to_s).to eq("+16165558856")
        expect(message.body).to eql("what ru doing?")
      end
    end

  end
end
