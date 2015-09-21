class Api::V1::VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:show, :update, :destroy]
  include Gotskills
  include Gotaliens

  respond_to :json

  def index
    @active = Vacancy.active.includes(:skills)
    @expired = Vacancy.arch.includes(:skills)
    @all = @active + @expired
    respond_with @all
  end

  def show
    got_skills @vacancy
    got_aliens @vacancy.skills, Employee.active.includes(:skills)
    respond_with @vacancy
  end

  def new
    @vacancy = Vacancy.new
    @skill = Skill.new
  end

  def create
    @vacancy= Vacancy.new(vacancy_params)
    @skill = Skill.new

    if @vacancy.skills.size == 0
      redirect_to :back, notice: 'Skills count cannot be zero'
    else
      respond_to do |format|
        if @vacancy.save
          format.html{ redirect_to @vacancy, notice: 'Vacancy created OK'}
          format.json{ render :show }
        else
          format.html{ render :new }
        end
      end
    end
  end

  def edit
    @vacancy = Vacancy.includes(:skills).find(params[:id])
    @skill = Skill.new
  end

  def update
    @vacancy.skill_links.build.build_skill

    respond_to do |format|
      if @vacancy.update(vacancy_params)
        format.html{ redirect_to @vacancy, notice: 'Vacancy edited OK'}
      else
        format.html{ render :edit, notice: 'Vacancy not edited'}
      end
    end
  end

  private

  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:title, :expired, :salary, :contact, skill_ids:[])
  end
end