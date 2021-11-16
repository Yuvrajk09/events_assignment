require "rails_helper"

RSpec.describe CommentsDetailResource, type: :resource do
  describe "serialization" do
    let!(:comments_detail) { create(:comments_detail) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(comments_detail.id)
      expect(data.jsonapi_type).to eq("comments_details")
    end
  end

  describe "filtering" do
    let!(:comments_detail1) { create(:comments_detail) }
    let!(:comments_detail2) { create(:comments_detail) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: comments_detail2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([comments_detail2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:comments_detail1) { create(:comments_detail) }
      let!(:comments_detail2) { create(:comments_detail) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      comments_detail1.id,
                                      comments_detail2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      comments_detail2.id,
                                      comments_detail1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
