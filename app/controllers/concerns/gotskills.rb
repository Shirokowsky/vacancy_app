module Gotskills # Kill, gothic, kill!
  def got_skills(item)
    @skillable = item
    @skills = @skillable.skill_links
    @skill = Skill.new
  end
end