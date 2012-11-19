class Index
  URL = "http://news.ycombinator.com"

  def initialize
    @page = Page.new(URL)
  end

  def urls
    links = @page.links.select { |link| link.start_with?("http") }
    links[1..25]
  end
end
