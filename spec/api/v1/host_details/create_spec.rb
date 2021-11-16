require 'rails_helper'

RSpec.describe "host_details#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/host_details", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'host_details',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(HostDetailResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { HostDetail.count }.by(1)
    end
  end
end
