require 'rails_helper'

RSpec.describe VacanciesController do
  let(:vacancy) { FactoryGirl.create :vacancy }

  it 'GET #index' do
    get :index
    expect(response).to have_http_status(200)
  end

  it 'GET #show' do
    get :show, id: vacancy.id
    expect(response).to be_success
  end
end
