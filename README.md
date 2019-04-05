### Fun with Presenter and Decorators.
Presenter vs Decorators? Why not use both?

### Snippets

#### Controller
```rb
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    @user = UserPresenter.new(
      UserDecorator.new(user)
    )
  end
end
```

#### Decorators
```rb
# app/decorators/user_decorator.rb
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
```

#### Presenter
```rb
class UserPresenter < SimpleDelegator
  def render_avatar(view)
    view.image_tag(avatar_url)
  end

  def render_follow_button(view)
    view.button_tag('Follow')
  end
end
```

#### View
```rb
<h1>Profile User</h1>

<p><%= @user.username %></p>
<p><%= @user.bio %></p>

<%= @user.render_avatar(self) %>

<p>
  <%= @user.render_follow_button(self) %>
</p>
```

**Goals**:
- Decrease size of model.
- Make your views dump (*not contains any logic*)