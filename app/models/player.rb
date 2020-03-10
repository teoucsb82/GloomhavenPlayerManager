class Player < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :character_class, :gold, :xp
  validates_numericality_of :gold, :xp, greater_than_or_equal_to: 0

end
