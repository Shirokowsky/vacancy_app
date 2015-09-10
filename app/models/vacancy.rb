class Vacancy < ActiveRecord::Base
  has_many :skills, as: :skillable
end

