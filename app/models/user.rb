class User < ApplicationRecord
  validates :first_name, presence: true, length: {maximum: 127}
  validates :last_name, length: {maximum: 127}
  validates :time_zone, inclusion: {in: ActiveSupport::TimeZone.all.map(&:name)}

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_person_name
end
