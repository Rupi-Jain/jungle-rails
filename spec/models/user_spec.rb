require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    before do 
      @user = User.new(name:"Rupi", email:"rj@gmail.com", password:"zzz", password_confirmation:"zzz")
      @user1 = User.new(name:"Rupi",email:"rj@gmail.com", password:"zzz", password_confirmation:"zzz")
    end

    describe 'validation for Users' do

      it "Password doen't match" do
        @user.password_confirmation = 'zzzz'         
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
      end

      it "Password length should be >= 8" do
        @user.password = 'z' 
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 2 characters)')
      end

      it "fail to save when the email address is not unique" do
        @user.password = 'zzz' 
        @user.save
        expect(@user1).to_not be_valid
        expect(@user1.errors.full_messages).to include('Email has already been taken')
      end

    end
  end

  describe '.authenticate_with_credentials' do
    before do 
      @user = User.new(name: "Rupi", email: "rj@gmail.com", password: "zzz", password_confirmation: "zzz")
    end

    it 'should allow users to login if they have the correct email and password' do
      @user.save
      user1 = User.authenticate_with_credentials('rj@gmail.com', 'zzz')
      expect(@user).to be ==  @user
    end

    it 'should pass even if email has spaces present in email' do
      @user.save
      user1 = User.authenticate_with_credentials(' rj@gmail.com  ', 'zzz')
      expect(@user).to be == @user
    end

    it 'should pass even if email has capital letters' do
      @user.save
      user1 = User.authenticate_with_credentials('Rj@Gmail.Com', 'zzz')
      expect(@user).to be == @user
    end

    it 'should fail if email does not exist in database' do
      @user.save
      user1 = User.authenticate_with_credentials('rjain@gmail.com', 'zzz')
      expect(user1).to be == nil
    end

    it 'should fail if password does not match with email in database' do
      @user.save
      user1 = User.authenticate_with_credentials('rj@gmail.com', 'zzzz')
      expect(user1).to be == false
    end
  end
end
