require 'spec_helper'

describe User do
  describe "passwords" do
    it 'needs a password and confirmation to save' do
      u = Usser.new(name: "Marc")

      u.save
      expect(u).to_not be_valid

      u.password = "password"
      u.password_confirmation = ""
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "password"
      u.save
      expect(u).to be_valid
    end

    it 'needs password and confirmation to match' do
      u = Usser.create(
        name: "Marc",
        password: "meinefrau011280",
        password_confirmation: "meinefrau011280"
      )
    end
  end
end
