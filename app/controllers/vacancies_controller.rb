class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:show, :edit, :destroy, :update, :destroy]
  include Gotskills
  include Gotaliens

  def index
    @active = Vacancy.active.includes(:skills)
    @expired = Vacancy.arch.includes(:skills)
  end

  def show
    got_skills @vacancy
    got_aliens @vacancy.skills, Employee.active.includes(:skills)
  end

  def new
    @vacancy = Vacancy.new
    @skill = Skill.new
  end

  def create
    @vacancy= Vacancy.new(vacancy_params)
    @skill = Skill.new
    respond_to do |format|
      if @vacancy.save
        format.html{ redirect_to @vacancy, notice: 'Vacancy created OK'}
        format.json{ render :show }
      else
        format.html{ render :new}
      end
    end
  end

  def edit
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

  def destroy
    @vacancy.destroy
    respond_to do |format|
      format.html{ redirect_to vacancies_path, notice: 'Vacancy killed' }
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