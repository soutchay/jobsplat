class User
  include Mongoid::Document
  field :username, type: String
  field :password, type: String
  field :location, type: String
end
