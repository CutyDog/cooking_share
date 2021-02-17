json.set! :post do
  json.extract! @post, :id, :title, :user_id, :text, :img, :created_at, :updated_at
end