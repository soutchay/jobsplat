class Company
  include Mongoid::Document
  field :name, type: String
  field :about, type: String
  field :address, type: String
  field :path, type: String
  field :created_at, type: Integer
  field :type, type: String
  field :updated_at, type: String

  has_many :jobs
end
