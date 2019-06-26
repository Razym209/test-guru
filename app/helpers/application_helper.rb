module ApplicationHelper

  def current_year
    DateTime.current.year
  end

    def flash_messages
    flash.map { |type, message| flash_message(message, type) }.join.html_safe
  end

  def flash_message(message, type)
    content_tag :p, message, class: "flash #{type}" if message
  end

  def welcome_message(user)
    "Добро пожаловать".html_safe
  end
end
