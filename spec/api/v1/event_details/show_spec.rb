require 'rails_helper'

RSpec.describe "event_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/event_details/#{event_detail.id}", params: params
  end

  describe 'basic fetch' do
    let!(:event_detail) { create(:event_detail) }

    it 'works' do
      expect(EventDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('event_details')
      expect(d.id).to eq(event_detail.id)
    end
  end
end
