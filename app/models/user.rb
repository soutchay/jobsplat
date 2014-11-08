class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  field :username, type: String
  field :password_digest, type: String
  field :location, type: String
  field :email, type: String
  field :is_verified, type: Mongoid::Boolean, default: false
  field :is_admin, type: Mongoid::Boolean, default: false

  validates_uniqueness_of :email
end
