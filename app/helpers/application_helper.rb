module ApplicationHelper
  def flash_message(type, message)
    notification_type = (type.to_s == "alert") ? "is-danger" : "is-primary"
    classes = "flash__message notification is-light #{notification_type}"
    content_tag :div, class: classes, data: {controller: "removals", action: "animationend->removals#remove".html_safe} do
      message
    end
  end
end
