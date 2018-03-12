require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe User do
    subject(:user) do
      FactoryBot.build(:user,
        email: "kevin@kevin.kevin",
        password: "password"
      )
    end
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "turns a password into a password digest" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token automatically" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end


end
