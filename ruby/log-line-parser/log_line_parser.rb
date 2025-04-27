LOG_LEVELS = {
  "INFO" => "INFO",
  "WARNING" => "WARNING",
  "ERROR" => "ERROR",
}

class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.gsub(/\[\w+\]:\s*|\s+$/, '')
  end

  def log_level
    log_level = @line.match(/\[(\w+)\]:\s*/)[1]
    LOG_LEVELS.fetch(log_level, "Unknown").downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
