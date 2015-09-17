module HasSkills
  def self.included(base)
    base.class_eval do
      has_many :skill_links, as: :skillable
      has_many :skills, through: :skill_links

      accepts_nested_attributes_for :skill_links
    end
  end
end