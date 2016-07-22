class Company < ActiveRecord::Base
  has_many :events
  def full_address
    "#{name} #{address}"
  end
end
