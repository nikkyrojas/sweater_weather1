class User < ApplicationRecord
  #before_create :api_key

  validates_presence_of :email
  validates_uniqueness_of :email


  has_secure_password 
  
  def api_key
    SecureRandom.hex 
  end
end
