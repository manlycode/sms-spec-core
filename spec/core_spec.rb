require "spec_helper"

describe SMS::Spec::Core do
  describe "#VERSION" do
    it "is a version number" do
      expect(subject::VERSION).to match(/\d+\.\d+\.\d+/)
    end
  end
end
