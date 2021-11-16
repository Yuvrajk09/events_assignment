class Api::V1::AttendanceStatusesController < Api::V1::GraphitiController
  def index
    attendance_statuses = AttendanceStatusResource.all(params)
    respond_with(attendance_statuses)
  end

  def show
    attendance_status = AttendanceStatusResource.find(params)
    respond_with(attendance_status)
  end

  def create
    attendance_status = AttendanceStatusResource.build(params)

    if attendance_status.save
      render jsonapi: attendance_status, status: :created
    else
      render jsonapi_errors: attendance_status
    end
  end

  def update
    attendance_status = AttendanceStatusResource.find(params)

    if attendance_status.update_attributes
      render jsonapi: attendance_status
    else
      render jsonapi_errors: attendance_status
    end
  end

  def destroy
    attendance_status = AttendanceStatusResource.find(params)

    if attendance_status.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: attendance_status
    end
  end
end
