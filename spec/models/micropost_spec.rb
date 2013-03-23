require 'spec_helper'

describe Micropost do

  context "attr_accessible" do

    it "content should be accessible" do
      FactoryGirl.create(:micropost, content: 'message')
      content_micropost = Micropost.first
      expect(content_micropost.content).to eq('message')
    end

    it "user_id should be accessible" do
      FactoryGirl.create(:micropost, user_id: 1)
      user_id_micropost = Micropost.first
      expect(user_id_micropost.user_id).to eq(1)
    end
  end

  context "user_id should be integer type" do

    it "user_id integer" do
      FactoryGirl.create(:micropost, user_id: 1)
      user_id_micropost = Micropost.first
      user_id_micropost.should be_valid
    end

    it "user_id string" do
      FactoryGirl.create(:micropost, user_id: 'string')
      user_id_micropost = Micropost.first
      user_id_micropost.user_id.should eq(0)
    end
  end

  it { should belong_to(:user) }

  it { should ensure_length_of(:content).is_at_most(10) }
end