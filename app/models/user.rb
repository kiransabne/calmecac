class User < ApplicationRecord
  rolify

  has_many :inscriptions, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :points
  has_many :levels
  has_many :badges, through: :levels

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/user_placeholder.png"
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

  def inscribed?(course)
    inscriptions.where(course_id: course.id).present?
  end

  def inscription_for(course)
    inscriptions.find_by(course_id: course.id)
  end

  def pontuation(kind_name)
    kind_id = Kind.find_by(name: kind_name)
    points.where(kind_id: kind_id).sum(:value)
  end

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
      old_pontuation = self.points.where(kind_id: kind.id).sum(:value)
    else
      old_pontuation = self.points.to_i
    end
    new_pontuation = old_pontuation + points
    Gioco::Core.sync_resource_by_points(self, new_pontuation, kind)
  end

  def next_badge?(kind_name = false)
    old_pontuation = pontuation(kind_name)

    next_badge       = Badge.where("points > #{old_pontuation}").order("points ASC").first

    if next_badge
      {
        badge: next_badge,
        points: next_badge.points - old_pontuation,
        next_badge_points: next_badge.points
      }
    else
      {
        badge: "",
        points: 0,
        next_badge_points: 0
      }
    end
  end
end
