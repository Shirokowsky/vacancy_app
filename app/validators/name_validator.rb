class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value =~ /\p{Latin}/
      record.errors[attribute] << (options[:message] || 'latin error')
    end

    unless value =~ /\A(\p{Cyrillic})+\s(\p{Cyrillic})+\s(\p{Cyrillic})+/
      record.errors[attribute] << (options[:message] || 'words count more or less 3')
    end
  end
end