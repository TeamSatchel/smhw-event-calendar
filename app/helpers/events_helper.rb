module EventsHelper
  def present(model, &block)
    presenter = EventPresenter.new(model)
    yield(presenter) if block_given?
  end
end
