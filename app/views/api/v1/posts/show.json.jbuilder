json.extract! @post, :id, :title, :categories, :content, :created_at

json.email @post.user.email
