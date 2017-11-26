class User < ApplicationRecord
  rolify

  has_many :points
  has_many :badges , through: :levels
  has_many :levels

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  attr_accessor :role

  def change_points(options)
    if Gioco::Core::KINDS
      points = options[:points]
      kind   = Kind.find(options[:kind])
    else
      points = options
      kind   = false
    end

    if Gioco::Core::KINDS
      raise "Missing Kind Identifier argument" if !kind
      old_pontuation = self.points.where(:kind_id => kind.id).sum(:value)
    else
      old_pontuation = self.points.to_i
    end

    new_pontuation = old_pontuation + points
    Gioco::Core.sync_resource_by_points(self, new_pontuation, kind)
  end

  def next_badge?(kind_id = false)
    if Gioco::Core::KINDS
      raise "Missing Kind Identifier argument" if !kind_id
      old_pontuation = self.points.where(:kind_id => kind_id).sum(:value)
    else
      old_pontuation = self.points.to_i
    end
    next_badge       = Badge.where("points > #{old_pontuation}").order("points ASC").first
    last_badge_point = self.badges.last.try('points')
    last_badge_point ||= 0

    if next_badge
      percentage      = (old_pontuation - last_badge_point) * 100 / (next_badge.points - last_badge_point)
      points          = next_badge.points - old_pontuation
      next_badge_info = {
        badge: next_badge,
        points: points,
        percentage: percentage
      }
    end
  end

  def set_role(role)
    role = if role.present?
             role.to_sym
           else
             :student
           end
    add_role role
  end
end
