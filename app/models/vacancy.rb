class Vacancy < ActiveRecord::Base
  include Has_skills

  validates :title, :salary, :contact, presence: true
  validates :contact, email: true

  #default_scope {where('expired > ?', Time.zone.now)}
  default_scope {order(salary: :desc)}

  scope :active, -> {where('expired > ?', Time.zone.now)}
  scope :arch, -> {where('expired < ?', Time.zone.now)}
end

