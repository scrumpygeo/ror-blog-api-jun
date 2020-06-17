json.array! @posts do |post|
    json.extract! post, :id, :title, :categories, :content, :created_at
    json.email post.user.email
end

  
  