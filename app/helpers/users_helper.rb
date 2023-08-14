module UsersHelper
  def avatar(user)
    content_tag :figure, class: "image is-32x32" do
      image_tag user.avatar_url, class: "is-rounded", size: 32, alt: user.name
    end
  end
end
