require 'rails_helper'

RSpec.describe "host_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/host_details/#{host_detail.id}"
  end

  describe 'basic destroy' do
    let!(:host_detail) { create(:host_detail) }

    it 'updates the resource' do
      expect(HostDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { HostDetail.count }.by(-1)
      expect { host_detail.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
