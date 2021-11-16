require 'rails_helper'

RSpec.describe "host_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/host_details", params: params
  end

  describe 'basic fetch' do
    let!(:host_detail1) { create(:host_detail) }
    let!(:host_detail2) { create(:host_detail) }

    it 'works' do
      expect(HostDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['host_details'])
      expect(d.map(&:id)).to match_array([host_detail1.id, host_detail2.id])
    end
  end
end
