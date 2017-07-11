module PostsHelper
  def render_post_form(post)
    simple_format(post.content)
  end
end
