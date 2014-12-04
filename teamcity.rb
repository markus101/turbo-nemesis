class TeamCity

  def self.progress_message(message)
    write_to_teamcity("progressMessage '#{message}'")
  end

  def self.progress_start(message)
    write_to_teamcity("progressStart '#{message}'")
  end

  def self.progress_stop(message)
    write_to_teamcity("progressStop '#{message}'")
  end

  def self.progress_finish(message)
    write_to_teamcity("progressFinish '#{message}'")
  end

  def self.open_block(message)
    write_to_teamcity("blockOpened name='#{message}'")
  end

  def self.close_block(message)
    write_to_teamcity("blockClosed name='#{message}'")
  end

  def self.publish_artifact(path)
    write_to_teamcity("publishArtifacts '#{path}'")
  end

  def self.set_parameter(name, value)
    write_to_teamcity("setParameter name='#{name}' value='#{value}'")
  end

  def self.build_status(status, text)
    raise "Invalid status: #{status}" unless status == nil or (status == 'FAILURE' or status == 'SUCCESS')

    command = 'buildStatus'
    command += " status='#{status}'" unless status == nil
    command += " text='#{text}'" unless text == nil

    write_to_teamcity(command)
  end

  def self.import_report(type, path, tool = nil)
    command = "importData type='#{type}' path='#{path}'"
    command << " tool='#{tool}'" if tool
    write_to_teamcity(command)
  end

  private

  def self.write_to_teamcity(command)
    puts "##teamcity[#{command}]"
  end
end
