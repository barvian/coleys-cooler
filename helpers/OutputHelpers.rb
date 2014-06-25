module OutputHelpers
  def format_phone(number)
    digits = number.to_s.gsub(/\D/, '').split(//)

    if (digits.length == 11 and digits[0] == '1')
      # Strip leading 1
      digits.shift
    end

    if (digits.length == 10)
      digits = digits.join
      '(%s) %s-%s' % [ digits[0,3], digits[3,3], digits[6,4] ]
    end
  end

  def data_options(name, options)
    attributes = []
    options.each do |key, value|
      attributes << "data-#{name}-#{key.to_s.dasherize}=\"#{value.to_s}\""
    end
    attributes.join " "
  end
end
