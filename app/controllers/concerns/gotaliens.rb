module Gotaliens

  def got_aliens own, alien
    @full, @parted = [], []
    alien.each do |v|
      c = own & v.skills
      c.size == v.skills.size ? @full << v : @parted << v
    end
  end

end