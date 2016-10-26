class User < ActiveRecord::Base
  # Include default devise modules. :confirmable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  enum role: [:guest, :admin]
end
