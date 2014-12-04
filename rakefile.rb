#$: << './'

require './logger'
require './kernel'
require './teamcity'

task :default do
  base_dir = Dir.pwd

  FileUtils.mkdir_p(File.join(base_dir, 'mark', 'test'), :verbose => true)

  message = 'Deploying IQ.Platform.Pricing'

  TeamCity.open_block(message)

  Logger.log('doing deploy things....')

  TeamCity.close_block(message)
end
