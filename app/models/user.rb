class User < ActiveRecord::Base
  has_many :wikis
  has_many :subscriptions
  has_many :collaborators
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def role?(base_role)
    role == base_role.to_s
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
