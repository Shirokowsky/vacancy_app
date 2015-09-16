class SkillLink < ActiveRecord::Base
  belongs_to :skillable, polymorphic: true
  belongs_to :skill, counter_cache: true
end