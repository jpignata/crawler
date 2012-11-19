require "highline"

class Outputter
  OUTPUT_WIDTH = 79

  def initialize(page)
    @page = page
  end

  def output
    highline.say("-" * OUTPUT_WIDTH)
    highline.say(@page.title)
    highline.say("-" * OUTPUT_WIDTH)

    highline.say(@page.paragraphs.join("\n\n"))
    highline.say("\n\n")
  end

  private

  def highline
    @highline ||= HighLine.new($stdin, $stdout, OUTPUT_WIDTH)
  end
end
