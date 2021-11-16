require 'rails_helper'

RSpec.describe "comments_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/comments_details/#{comments_detail.id}"
  end

  describe 'basic destroy' do
    let!(:comments_detail) { create(:comments_detail) }

    it 'updates the resource' do
      expect(CommentsDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CommentsDetail.count }.by(-1)
      expect { comments_detail.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
