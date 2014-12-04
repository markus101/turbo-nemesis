class Logger
  def self.initialize_filtered_terms
    @filtered_terms = @filtered_terms || []
  end

  def self.log(message)
    kernel_puts cleanse message
  end

  #TODO: this should change colour or something cool like that
  def self.warn(message)
    kernel_warn message
  end

  #TODO: this should change colour or something cool like that
  def self.error(message)
    kernel_puts message
  end

  def self.cleanse_then_log(message)
    kernel_puts '[Deprecated: Use Logger.Log]'
    message = cleanse(message)
    kernel_puts message
  end

  def self.cleanse(message)
    self.initialize_filtered_terms

    return message unless message.is_a? String

    @filtered_terms.each do |term|
      message.gsub!(term, '********')
    end

    message
  end

  def self.add_to_filtered_words(term)
    self.initialize_filtered_terms

    @filtered_terms << term
  end
end