module UsersHelper
  def avatar(user)
    content_tag :figure, class: "image is-32x32" do
      if user.avatar_url
        image_tag user.avatar_url, class: "is-rounded", size: 32, alt: user.name
      else
        content_tag :span, class: "icon" do
          tag.i class: "fas fa-user-secret is-size-3"
        end
      end
    end
  end
end
