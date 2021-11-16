require 'rails_helper'

RSpec.describe "comments_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/comments_details/#{comments_detail.id}", params: params
  end

  describe 'basic fetch' do
    let!(:comments_detail) { create(:comments_detail) }

    it 'works' do
      expect(CommentsDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('comments_details')
      expect(d.id).to eq(comments_detail.id)
    end
  end
end
