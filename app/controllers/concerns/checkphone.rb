module Checkphone

  def check_phone phone
    case phone
      when /\A(\d{3}\W){2}(\d{2}\W)\d{2}\z/ # 945-945-45-45
        phone = '8' + phone.gsub!(/[^0-9]/,'')
      when /\A\d{10}\z/ # 9879874545
        phone = '8' + phone
      when /\A[8]\s(\d{3}\s){2}(\d{2}\s)\d{2}\z/ # 8 945 945 45 45
        phone = phone.gsub!(/[^0-9]/,'')
      when /\A[8]\d{10}\z/ # 89459454545
        phone = phone.gsub!(/[^0-9]/,'')
      when /\A(\w+)@([a-z0-9]+\.)[a-z]{2,3}\z/ # email
        phone
      else
        phone = phone.gsub!(/[^0-9]/,'')
    end
  end

end