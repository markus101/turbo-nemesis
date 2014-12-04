$: << './'

require 'logger'
require 'kernel'


task :default do
  FileUtils.mkdir_p('mark_test', :verbose => true)
end
