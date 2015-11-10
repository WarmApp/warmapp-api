class ApplicationError < StandardError
  attr_accessor :status, :class
end
