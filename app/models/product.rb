class Product < ActiveRecord::Base
  belongs_to :supplier

  def self.for_user user
    if user.admin?
      self.all
    elsif user.supplier.present?
      user.supplier.products
    else
      self.none
    end
  end
end
