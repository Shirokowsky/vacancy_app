class Skill < ActiveRecord::Base
  has_many :skill_links
  has_many :skillables, through: :skill_links

  has_many :vacancies, through: :skill_links, source: :skillable, source_type: 'Vacancy'
  has_many :employees, through: :skill_links, source: :skillable, source_type: 'Employee'

  validates :name, presence: true, uniqueness: true
end