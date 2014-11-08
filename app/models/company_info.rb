class CompanyInfo
	include Mongoid::Document
	field :updated_at, type: Integer
	field :name, type: String
	field :path, type: String
	field :created_at, type: Integer
	field :type, type: String
	
end