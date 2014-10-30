class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  field :username, type: String
  field :password_digest, type: String
  field :location, type: String
  field :email, type: String
end
