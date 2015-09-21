require 'rails_helper'

RSpec.describe Employee, type: :model do

  let(:employee) { FactoryGirl.create :employee }

  it { expect(build(:employee)).to be_valid }
  it { expect(build(:employee, contact: '9459454545')).to be_valid }
  it { expect(build(:employee, contact: '8 945 945 45 45')).to be_valid }
  it { expect(build(:employee, contact: '945-945-45-45')).to be_valid }
  it { expect(build(:employee, contact: 'marco456@polo.com')).to be_valid }
  it { expect(build(:employee, contact: 'marco456@polo.456com')).not_to be_valid }
  it { expect(build(:employee, contact: '312')).not_to be_valid }
  it { expect(build(:employee, contact: '123456789012345')).not_to be_valid }

end

