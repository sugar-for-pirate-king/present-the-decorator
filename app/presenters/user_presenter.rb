class UserPresenter < SimpleDelegator
  def render_avatar(view)
    view.image_tag(avatar_url)
  end

  def render_follow_button(view)
    view.button_tag('Follow')
  end
end