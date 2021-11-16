require "rails_helper"

RSpec.describe "host_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/host_details/#{host_detail.id}", params: params
  end

  describe "basic fetch" do
    let!(:host_detail) { create(:host_detail) }

    it "works" do
      expect(HostDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("host_details")
      expect(d.id).to eq(host_detail.id)
    end
  end
end
