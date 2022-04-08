require "test_helper"

class QuotesHelperTest < ActionView::TestCase
  def setup
    @view_flow = ActionView::OutputFlow.new
  end

  test "should return open graph tags for the quote" do
    quote = quotes(:two)
    open_graph_tags(quote)
    assert_equal quote_url(quote), content_for(:og_url)
    assert_equal "#{quote.text} - #{quote.author_name}", content_for(:og_description)
  end
end
