module ApplicationHelper
  def flash_message(type, message)
    notification_type = (type.to_s == "alert") ? "is-danger" : "is-primary"
    classes = "flash__message notification is-light #{notification_type}"
    content_tag :div, class: classes, data: {controller: "removals", action: "animationend->removals#remove".html_safe} do
      message
    end
  end

  def title
    return t("letterkenny") unless content_for?(:title)
    "#{content_for(:title)} | #{t("letterkenny")}"
  end

  def og_description
    content_for?(:og_description) ? content_for(:og_description) : t("tagline")
  end

  def og_url
    content_for?(:og_url) ? content_for(:og_url) : root_url
  end
end
