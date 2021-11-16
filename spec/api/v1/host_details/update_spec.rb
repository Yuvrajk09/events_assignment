require "rails_helper"

RSpec.describe "host_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/host_details/#{host_detail.id}", payload
  end

  describe "basic update" do
    let!(:host_detail) { create(:host_detail) }

    let(:payload) do
      {
        data: {
          id: host_detail.id.to_s,
          type: "host_details",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(HostDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { host_detail.reload.attributes }
    end
  end
end
