class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :salary, :contact

  has_many :skills, through: :skill_links
end
