module Kernel
  alias_method :kernel_warn, :warn
  alias_method :kernel_puts, :puts
end

def puts(message = '')
  Logger.log '[Deprecated: Use Logger.log] ' + message
end

#def warn(message = '')
#  Logger.warn '[Deprecated: Use Logger.warn] ' + message
#end

def ap(object, options = {})
  Logger.log object.ai(options)
  object unless AwesomePrint.console?
end

def pp_s(object = '')
  dump = PP.pp(object, '')
  Logger.log dump
end
