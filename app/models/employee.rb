class Employee < ActiveRecord::Base
  include Has_skills

  validates :name, :contact, presence: true
  validates :name, name: true
  validates :contact, email: true

  default_scope {order(salary: :asc)}

  scope :active, -> {where(status: true)}
end
