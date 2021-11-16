class Api::V1::HostDetailsController < Api::V1::GraphitiController
  def index
    host_details = HostDetailResource.all(params)
    respond_with(host_details)
  end

  def show
    host_detail = HostDetailResource.find(params)
    respond_with(host_detail)
  end

  def create
    host_detail = HostDetailResource.build(params)

    if host_detail.save
      render jsonapi: host_detail, status: :created
    else
      render jsonapi_errors: host_detail
    end
  end

  def update
    host_detail = HostDetailResource.find(params)

    if host_detail.update_attributes
      render jsonapi: host_detail
    else
      render jsonapi_errors: host_detail
    end
  end

  def destroy
    host_detail = HostDetailResource.find(params)

    if host_detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: host_detail
    end
  end
end
