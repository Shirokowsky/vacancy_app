class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)

    case value
      # 945-945-45-45
      when /\A(\d{3}\W*){2}(\d{2}\W*)\d{2}\z/
        value = '8' + value.gsub(/[^0-9]/,'')
      # 9879874545
      when /\A\d{10}\z/
        value = '8' + value
      # 8 945 945 45 45
      when /\A[8]\s(\d{3}\s){2}(\d{2}\s)\d{2}\z/
        value = value.gsub(/[^0-9]/,'')
      # 89459454545
      when /\A[8]\d{10}\z/
        value = value.gsub(/[^0-9]/,'')
      # email
      when /\A(\w+)@([a-z0-9]+\.)[a-z]{2,3}\z/
        value
      else
        value = value.gsub(/[^0-9]/,'')
    end

    case value
      when /\A\d{11}\z/
      when /\A(\w+)@([a-z0-9]+\.)[a-z]{2,3}\z/
      else record.errors[attribute] << (options[:message] || 'phone or email value invalid')
    end
  end

end

