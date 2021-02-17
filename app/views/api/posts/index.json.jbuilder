json.set! :posts do
  json.array! @posts do |post|
    json.extract! post, :id, :title, :user_id, :text, :img, :created_at, :updated_at
  end
end