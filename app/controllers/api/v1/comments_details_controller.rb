class Api::V1::CommentsDetailsController < Api::V1::GraphitiController
  def index
    comments_details = CommentsDetailResource.all(params)
    respond_with(comments_details)
  end

  def show
    comments_detail = CommentsDetailResource.find(params)
    respond_with(comments_detail)
  end

  def create
    comments_detail = CommentsDetailResource.build(params)

    if comments_detail.save
      render jsonapi: comments_detail, status: :created
    else
      render jsonapi_errors: comments_detail
    end
  end

  def update
    comments_detail = CommentsDetailResource.find(params)

    if comments_detail.update_attributes
      render jsonapi: comments_detail
    else
      render jsonapi_errors: comments_detail
    end
  end

  def destroy
    comments_detail = CommentsDetailResource.find(params)

    if comments_detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: comments_detail
    end
  end
end
