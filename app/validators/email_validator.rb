class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    case value
      when /\A\d{11}\z/
      when /\A(\w+)@([a-z0-9]+\.)[a-z]{2,3}\z/
      else record.errors[attribute] << (options[:message] || 'telephone or email value invalid')
    end
  end

end

