require "spec_helper"

describe SMS::Spec::Core::MessageCenter do
  subject { SMS::Spec::Core::MessageCenter.instance }

  before do
    # Forcefully reset sent messages
    subject.instance_eval { @sent = [] }
  end

  it "is empty" do
    expect(subject.sent).to be_empty
    expect(subject.received).to be_empty
  end

  describe "#add_sent" do
    it "adds a sent message" do
      subject.add_sent(from: "616-555-1234", to: "616-555-5678", body: "Hello, this is a message")

      expect(subject.sent.count).to eq(1)
      expect(subject.sent.first.body).to eq("Hello, this is a message")
      expect(subject.sent.first.from.to_s).to match("+16165551234")
      expect(subject.sent.first.to.to_s).to match("+16165555678")
    end
  end

  describe ".add_sent" do
  end
end
