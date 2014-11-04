class Company
  include Mongoid::Document
  field :name, type: String
  field :about, type: String
  field :address, type: String

  has_many :jobs
end
