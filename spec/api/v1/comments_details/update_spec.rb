require 'rails_helper'

RSpec.describe "comments_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/comments_details/#{comments_detail.id}", payload
  end

  describe 'basic update' do
    let!(:comments_detail) { create(:comments_detail) }

    let(:payload) do
      {
        data: {
          id: comments_detail.id.to_s,
          type: 'comments_details',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CommentsDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { comments_detail.reload.attributes }
    end
  end
end
