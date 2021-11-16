require "rails_helper"

RSpec.describe "event_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/event_details", params: params
  end

  describe "basic fetch" do
    let!(:event_detail1) { create(:event_detail) }
    let!(:event_detail2) { create(:event_detail) }

    it "works" do
      expect(EventDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["event_details"])
      expect(d.map(&:id)).to match_array([event_detail1.id, event_detail2.id])
    end
  end
end
