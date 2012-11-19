require "open-uri"
require "nokogiri"

class Page
  def initialize(url)
    @url = url
  end

  def links
    document.css("a").map { |anchor| anchor["href"] }
  end

  def paragraphs
    document.css("p").map { |paragraph| paragraph.text }
  end

  def title
    node = document.css("title")
    node && node.text
  end

  def get
    document
    self
  end

  private

  def document
    @document ||= Nokogiri::HTML(content)
  end

  def content
    open(@url)
  end
end
