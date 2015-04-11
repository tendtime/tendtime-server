class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_inclusion_of :role,
                         in: %w(admin architect supplier),
                         allow_blank: true

  belongs_to :supplier

  def admin?
    role == 'admin'
  end

  def supplier?
    role == 'supplier'
  end

  def architect?
    role == 'architect'
  end
end
