$: << './'

require 'logger'
require 'kernel'


task :default do
  base_dir = Dir.pwd

  FileUtils.mkdir_p(File.join(base_dir, 'mark', 'test'), :verbose => true)
end
