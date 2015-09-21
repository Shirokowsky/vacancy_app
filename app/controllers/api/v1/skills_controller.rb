class Api::V1::SkillsController < ApplicationController
  before_action :set_skill, except: [:index, :new, :create]
  include Gotskills
  respond_to :json

  def index
    @skills = Skill.includes(:skill_links)
    respond_with @skills
  end

  def new
    @skill = Skill.new
  end


  def create
    @skill = Skill.new(skill_params)
    @skill.save
  end


  private

  def load_skills
    resource, id = request.path.split('/')[1,2]
    @skillable = resource.singularize.classify.constantize.find(id)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name)
  end

end