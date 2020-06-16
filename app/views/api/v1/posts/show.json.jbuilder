json.extract! @post, :id, :title, :categories, :content, :created_at

json.user do
    json.email @post.user.email

end