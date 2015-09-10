class Employee < ActiveRecord::Base
  has_many :skills, as: :skillable
end
