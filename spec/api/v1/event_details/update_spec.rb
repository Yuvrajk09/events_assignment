require 'rails_helper'

RSpec.describe "event_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/event_details/#{event_detail.id}", payload
  end

  describe 'basic update' do
    let!(:event_detail) { create(:event_detail) }

    let(:payload) do
      {
        data: {
          id: event_detail.id.to_s,
          type: 'event_details',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(EventDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { event_detail.reload.attributes }
    end
  end
end
