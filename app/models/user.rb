class User < ActiveRecord::Base
  # Include default devise modules. :confirmable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  enum role: [:guest, :admin]

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :guest
  end
end
