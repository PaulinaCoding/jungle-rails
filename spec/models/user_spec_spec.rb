require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do


    it "is valid with all valid attributes" do
      @user = User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password: "abc", password_confirmation: "abc"
     expect(@user).to be_valid
    end
      

    it "is not valid without a first name" do
        @user = User.create last_name: "Lannister", email: "tyrion@tyrion.com", password: "abc", password_confirmation: "abc"
        expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid without a last name" do
      @user = User.create first_name: "Tyrion", email: "tyrion@tyrion.com", password: "abc", password_confirmation: "abc"
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid without a password" do
      @user = User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password_confirmation: "abc"
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid without password confirmation" do
      @user = User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password: "abc"
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end


    describe 'log-in' do
      before :each do
        # create a success case
        # correct input parameters
        @user_credentials = {email: 'john.doe@gmail.com', password: 'abc'}
        # check if existing email in db matches the input email parameter 
        # make sure you lowercase the email from db as well as the input email parameter
        @user = User.where('lower(email) like ?', @user_credentials[:email])[0]
      end

      it 'email must be unique but not case sensitive' do
        @user_credentials[:email] = 'JohN.DoE@gmail.com'
        @user = User.where('lower(email) like ?', @user_credentials[:email].downcase)[0]
       expect(@user).to_not be nil

      end 
    end

   
    describe "register" do
      puts "------Testing user password length!---------"
      # puts  @user.password.length
      #   before :each do
        it "password must be minimum 3 characters long." do
          @user = User.new(User.create first_name: "Tyrion", last_name: "Lannister", email: "tyrion@tyrion.com", password: "ab", password_confirmation: "ab")
          # expect(@user) to_not be_valid 
          expect (@user.password).count <= 3
    # expect @user[:password].length <= 3 
    #       # have_at_least(8).items
    # it {is_expected.to validate_length_of(:password).with_minimum(3).with_message("Password should be minimum 3 characters long.")}

        end
      end
    end

  end

  # describe '.authenticate_with_credentials' do
  #   # examples for this class method here
  # end
end
