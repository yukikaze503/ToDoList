json.extract! todo, :id, :title, :remark, :is_finished, :created_at, :updated_at
json.url todo_url(todo, format: :json)