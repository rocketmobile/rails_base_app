module AllowExceptionsHelper
  def self.included(klass)
    debugger
    ApplicationController.rescue_handlers = []
  end
end