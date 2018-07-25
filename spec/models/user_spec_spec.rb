require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do


    it "should have all valid attributes" do
      @user = User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password: "abc", password_confirmation: "abc"
      expect(@user).to be_valid
    end
      

    it "should not be valid without a first name" do
        @user = User.create last_name: "Lannister", email: "tyrion@tyrion.com", password: "abc", password_confirmation: "abc"
        expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should not be valid without a last name" do
      @user = User.create first_name: "Tyrion", email: "tyrion@tyrion.com", password: "abc", password_confirmation: "abc"
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should not be valid without a password" do
      @user = User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password_confirmation: "abc"
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not be valid without password confirmation" do
      @user = User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password: "abc"
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end


    it 'email must be unique but not case sensitive' do
      @user = User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password: "abc", password_confirmation: "abc"
      @second_user = User.create first_name: "Kate", last_name: "Smith", email: "TyRioN@tyrioN.COM", password: "345", password_confirmation: "345"
      # expect(@second_user).to_not be_valid 
      # puts @second_user.errors.full_messages
      expect(@second_user.errors.full_messages).to include("Email has already been taken")
    end 


    it "password must be minimum 3 characters long." do
      @user = User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password: "ab", password_confirmation: "ab"
      # expect(@user).to_not be_valid 
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

    
  end

  describe '.authenticate_with_credentials' do

    it "should authenticate with the correct password" do
      @user = User.create first_name: "Tom", last_name: "Cat", email: "tom@tom.com", password: "qwerty", password_confirmation: "qwerty"
      authenticated_user = User.authenticate_with_credentials("tom@tom.com ", "qwerty")
      expect(authenticated_user).to be_truthy
    end
    it "should not authenticate with the wrong password" do
      @user = User.create first_name: "Tom", last_name: "Cat", email: "tom@tom.com", password: "qwerty", password_confirmation: "qwerty"
      authenticated_user = User.authenticate_with_credentials("tom12345@tom.com ", "qwerty")
      expect(authenticated_user).to be_falsey
    end

    it "should authenticate with the extra spaces added to the email address" do
      @user = User.create first_name: "Tom", last_name: "Cat", email: "tom@tom.com", password: "qwerty", password_confirmation: "qwerty"
      authenticated_user = User.authenticate_with_credentials("  tom@tom.com  ", "qwerty")
      expect(authenticated_user).to be_truthy
    end

    it "should authenticate both with lowercase and uppercase" do
      @user = User.create first_name: "Tom", last_name: "Cat", email: "tom@tom.com", password: "qwerty", password_confirmation: "qwerty"
      authenticated_user = User.authenticate_with_credentials("TOM@tOm.cOm", "qwerty")
      expect(authenticated_user).to be_truthy
    end
  end
end
