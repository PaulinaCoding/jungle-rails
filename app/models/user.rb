class User < ActiveRecord::Base


  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 3}
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)

    user = self.find_by email: (email.strip).downcase
    if user
      # We have a valid user
      user.authenticate(password)
    end
  end

end

