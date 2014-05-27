if defined?(Pry)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'

  # allow pry to be bound to anywhere
  module Kernel
    def debugger
      binding.of_caller(1).pry
    end

    alias breakpoint debugger unless respond_to?(:breakpoint)
  end
end