class User < ApplicationRecord
  rolify
  rewardable

  has_many :inscriptions, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  attr_accessor :role

  def set_role(role)
    role = if role.present?
             role.to_sym
           else
             :student
           end
    add_role role
  end
end
