class RoomSearch < ActiveRecord::Base
  belongs_to :search
  after_validation :validate_adults_children

  private
  def validate_adults_children
    errors.add(:adults_number, 'can not be zero') if adults_number + minors_number == 0
  end
end
