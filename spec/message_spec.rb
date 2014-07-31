require "spec_helper"

describe SMS::Spec::Core::Message do
  subject { SMS::Spec::Core::Message.new(to: "616-555-1234", from: "616-555-5678", body: "Hello") }

  it "assigns opts to the corresponding attributes" do
    expect(subject.body).to eq("Hello")
    expect(subject.from).to_not be_nil
    expect(subject.to).to_not be_nil
  end

  it "can set body, from, and to directly" do
    subject.body = "Here is the body content"
    subject.from = "616-555-2298"
    subject.to = "616-555-2297"

    expect(subject.body).to eq("Here is the body content")
    expect(subject.from).to_not be_nil
    expect(subject.to).to_not be_nil
  end

  describe "assigning phone numbers" do
    it "parses phone numbers" do
      subject.from = subject.to = "616-555-2297"

      expect(subject.to).to be_a(Phoner::Phone)
      expect(subject.from).to be_a(Phoner::Phone)
    end

    it "validates phone numbers" do
      expect {
        subject.to = "foo bar"
      }.to raise_error(%(Could not parse the phone number: "foo bar"))
    end
  end

  describe "assigning body" do
    it "validates character limit" do
      valid_message = "Yo!"
      long_message = "Hello, this is chris. Today I had a bowl of breakfast, and after that. I decided to write you a text. It's a real good one. So, what's up buddy?"

      expect {
        subject.body = valid_message
      }.not_to raise_error

      expect {
        subject.body = long_message
      }.to raise_error(%(The message: \n "#{long_message}"\n\n contains (144/140) characters))
    end
  end
end
