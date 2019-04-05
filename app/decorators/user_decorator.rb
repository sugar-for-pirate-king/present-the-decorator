class UserDecorator < SimpleDelegator
  def username
    super || 'None given'
  end

  def bio
    super || 'None given'
  end

  def avatar_url
    super || default_avatar_url
  end

  private

  def default_avatar_url
    'https://avatars1.githubusercontent.com/u/46064704?s=200&v=4'
  end
end
