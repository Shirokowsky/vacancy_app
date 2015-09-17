require 'rails_helper'

RSpec.describe 'Vacancies', type: :request do
  let(:valid_session) { {} }

  describe 'JSON' do
    it 'index JSON' do
      FactoryGirl.create_list(:vacancy, 10)
      get '/vacancies', { format: :json }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).length).to eq(10)
    end

    it 'show JSON' do
      vacancy = FactoryGirl.create(:vacancy, title: 'Sever')
      get '/vacancies/' + vacancy.to_param, { format: :json }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['title']).to eq('Sever')
    end
  end
end