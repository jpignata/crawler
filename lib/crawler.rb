class Crawler
  def initialize(index)
    @index = index
  end

  def crawl
    pages.each do |page|
      Outputter.new(page).output
    end
  end

  private

  def pages
    futures.map(&:value)
  end

  def futures
    @index.urls.map do |url|
      future { Page.new(url).get }
    end
  end
end
