class Api::V1::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]
  include Gotskills
  include Gotaliens
  respond_to :json

  def index
    @employees = Employee.includes(:skills)
    respond_with @employees
  end

  def show
    got_skills @employee
    got_aliens @employee.skills, Vacancy.active.includes(:skills).order(salary: :desc)
    respond_with @employee
  end

  def new
    @employee = Employee.new
    @skill = Skill.new
  end

  def edit
    @employee = Employee.includes(:skills).find(params[:id])
    @skill = Skill.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.status ||= false
    @employee.salary = @employee.salary || 0
#    respond_with :api, :v1, Lead.create(lead_params)

    if @employee.skills.size == 0
      redirect_to :back, notice: 'Skills count cannot be zero'
    else
      respond_to do |format|
        if @employee.save
          format.html{ redirect_to @employee, notice: 'Employee created OK'}
          format.json{ render :show }
        else
          format.html{ render :new}
        end
      end
    end
  end

  def update
    @employee.skill_links.build.build_skill
    #    respond_with lead.update(lead_params)

    respond_to do |format|
      if @employee.update(employee_params)
        format.html{ redirect_to @employee, notice: 'Employee edited OK'}
      else
        format.html{ render :edit, notice: 'Employee not edited'}
      end
    end
  end

  def destroy
    @employee.destroy
#    respond_with lead.destroy
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :contact, :status, :salary, skill_ids:[])
  end

end