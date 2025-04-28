class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    begin
      unless ALLOWED_OPERATIONS.include?(operation)
        raise UnsupportedOperation
      end

      unless first_operand.kind_of?(Integer) && second_operand.kind_of?(Integer) && operation.kind_of?(String)
        raise ArgumentError
      end

      arithmetic_operation = "#{first_operand} #{operation} #{second_operand}"
      result = eval(arithmetic_operation)

      "#{arithmetic_operation} = #{result}"
    rescue => error
      if error.kind_of?(ZeroDivisionError)
        return "Division by zero is not allowed."
      end

      raise error
    end
  end
end
