require 'rails_helper'

RSpec.describe Vacancy, type: :model do

  let(:vacancy) { FactoryGirl.create :vacancy }

  it { expect(build(:vacancy)).to be_valid }
end

