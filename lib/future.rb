class Future
  def initialize(callable)
    @callable = callable
  end

  def run
    @thread ||= Thread.new { @value = @callable.call }

    self
  end

  def value
    run
    @thread.join unless defined?(@value)

    @value
  end
end

module Kernel
  def future(&block)
    Future.new(block).run
  end
end
