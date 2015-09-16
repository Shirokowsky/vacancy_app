class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :show, :update, :destroy]
  include Gotskills
  include Gotaliens

  def index
    @employees = Employee.includes(:skills)
  end

  def show
    got_skills @employee
    got_aliens @employee.skills, Vacancy.active.includes(:skills)
  end

  def new
    @employee = Employee.new
    @skill = Skill.new
  end

  def edit
    @skill = Skill.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.contact = check_phone @employee.contact
    @employee.status = @employee.status || true
    @employee.salary = @employee.salary || 0

    respond_to do |format|
      if @employee.save
        format.html{ redirect_to @employee, notice: 'Employee created OK'}
        format.json{ render :show }
      else
        format.html{ render :new}
      end
    end
  end

  def update
    @employee.skill_links.build.build_skill
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

  def check_phone phone
    case phone
      when /\A(\d{3}\W){2}(\d{2}\W)\d{2}\z/ # 945-945-45-45
        phone = '8' + phone.gsub!(/[^0-9]/,'')
      when /\A\d{10}\z/ # 9879874545
        phone = '8' + phone
      when /\A[8]\s(\d{3}\s){2}(\d{2}\s)\d{2}\z/ # 8 945 945 45 45
        phone = phone.gsub!(/[^0-9]/,'')
      when /\A[8]\d{10}\z/ # 89459454545
        phone = phone.gsub!(/[^0-9]/,'')
      when /\A(\w+)@([a-z0-9]+\.)[a-z]{2,3}\z/ # email
        phone
      else
        phone = phone.gsub!(/[^0-9]/,'')
      end
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :contact, :status, :salary, skill_ids:[])
  end

end