class Vacancy < ActiveRecord::Base
  include HasSkills

  validates :title, :salary, :contact, presence: true
  validates :contact, email: true

  # we can use this default scope, but default_scope can be sux
  # default_scope {order(salary: :desc)}

  scope :active, -> {where('expired > ?', Time.zone.now)}
  scope :arch, -> {where('expired < ?', Time.zone.now)}
end

