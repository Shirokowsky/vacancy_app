class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]
  include Gotskills
  include Gotaliens
  include Checkphone

  def index
    @employees = Employee.includes(:skills)
  end

  def show
    got_skills @employee
    # with default_scope
    # got_aliens @employee.skills, Vacancy.active.includes(:skills)
    # w/o default_scope
    got_aliens @employee.skills, Vacancy.active.includes(:skills).order(salary: :desc)
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
    @employee.contact = check_phone(@employee.contact)
    @employee.status ||= false
    @employee.salary = @employee.salary || 0
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
    @employee.contact = check_phone(@employee.contact)

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
    respond_to do |format|
      format.html{ redirect_to employees_path, notice: 'Employee killed' }
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :contact, :status, :salary, skill_ids:[])
  end

end