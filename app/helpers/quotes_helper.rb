module QuotesHelper
  def another_quote_button
    if slug_param.nil?
      link_to "Have another?", random_quote_path, class: "button"
    else
      link_to "Have another?", random_character_quote_path(slug: slug_param), class: "button"
    end
  end
end
