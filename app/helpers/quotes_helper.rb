module QuotesHelper
  def open_graph_tags(quote)
    content_for :og_url, quote_url(quote)
    content_for :og_description, "#{quote.text} - #{quote.author}"
  end
end
