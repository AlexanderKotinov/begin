require 'spec_helper'

describe User do
  
  context "attr_accessible" do

    it "email should be accessible" do
      FactoryGirl.create(:user, email: 'mail@mail.com')
      user_email = User.first
      expect(user_email.email).to eq('mail@mail.com')
    end

    it "name should be accessible" do
      FactoryGirl.create(:user, name: 'user_name')
      user_name = User.first
      expect(user_name.name).to eq('user_name')
    end
  end

  it { should have_many(:microposts) }
end
