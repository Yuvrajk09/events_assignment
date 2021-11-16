require "rails_helper"

RSpec.describe "event_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/event_details/#{event_detail.id}"
  end

  describe "basic destroy" do
    let!(:event_detail) { create(:event_detail) }

    it "updates the resource" do
      expect(EventDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { EventDetail.count }.by(-1)
      expect { event_detail.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
