class User < ActiveRecord::Base
  attr_accessible :crypted_password, :email, :login, :name, :password, :password_confirmation, :persistence_token, :salt
  acts_as_authentic
end
