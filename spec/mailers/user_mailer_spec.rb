require "spec_helper"

describe UserMailer do
  describe "birthday_and_anniversary_report" do
    let(:mail) { UserMailer.birthday_and_anniversary_report }

    it "renders the headers" do
      mail.subject.should eq("Birthday and anniversary report")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
