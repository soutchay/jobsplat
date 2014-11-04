class Job
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :salary, type: String
  field :is_open, type: Mongoid::Boolean
  
  belongs_to :company
end
