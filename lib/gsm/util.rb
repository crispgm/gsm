module Gsm
  module Util
    
    def self.capture_output
      begin
        # The output stream must be an IO-like object. In this case we capture it in
        # an in-memory IO object so we can return the string value. You can assign any
        # IO object here.
        previous_stdout, $stdout = $stdout, StringIO.new
        yield
        $stdout.string
      ensure
        # Restore the previous value of stdout (typically equal to STDOUT).
        $stdout = previous_stdout
      end
    end
  end
end