class SkillsController < ApplicationController
  before_action :set_skill, except: [:index, :new, :create]
  #before_action :load_skills
  include Gotskills

  def index
    @skills = Skill.includes(:skill_links).all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      respond_to do |format|
        format.html{redirect_to :back, notice:'skill created'}
      end
    else
      render :new
    end
  end

  def edit

  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html {redirect_to @skillable, notice:'skill killed'}
    end
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