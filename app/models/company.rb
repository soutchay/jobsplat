class Company
  include Mongoid::Document
  field :name, type: String
  field :about, type: String
  field :positions, type: String
  field :address, type: String
  embeds_many :jobs
end
