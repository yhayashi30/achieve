json.extract! submit_request, :id, :user_id, :task_id, :message, :request_user_id, :status, :created_at, :updated_at
json.url submit_request_url(submit_request, format: :json)