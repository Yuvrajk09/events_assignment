require "rails_helper"

RSpec.describe "comments_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/comments_details", params: params
  end

  describe "basic fetch" do
    let!(:comments_detail1) { create(:comments_detail) }
    let!(:comments_detail2) { create(:comments_detail) }

    it "works" do
      expect(CommentsDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["comments_details"])
      expect(d.map(&:id)).to match_array([comments_detail1.id,
                                          comments_detail2.id])
    end
  end
end
