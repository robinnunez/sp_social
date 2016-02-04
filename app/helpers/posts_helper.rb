module PostsHelper
  def post_buttons(post_id)
    if current_user.id == post_id
      return true
    end
  end
end
