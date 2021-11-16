require "rails_helper"

RSpec.describe CommentsDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "comments_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CommentsDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CommentsDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:comments_detail) { create(:comments_detail) }

    let(:payload) do
      {
        data: {
          id: comments_detail.id.to_s,
          type: "comments_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CommentsDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { comments_detail.reload.updated_at }
      # .and change { comments_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:comments_detail) { create(:comments_detail) }

    let(:instance) do
      CommentsDetailResource.find(id: comments_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CommentsDetail.count }.by(-1)
    end
  end
end
