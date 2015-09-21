class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name

  #has_many :vacancies, through: :skill_links, source: :skillable, source_type: 'Vacancy'
  #has_many :employees, through: :skill_links, source: :skillable, source_type: 'Employee'
end
