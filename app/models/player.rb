class Player < ApplicationRecord
  belongs_to :user
  serialize :perks, Array

  validates_presence_of :name, :character_class, :gold, :xp
  validates_numericality_of :gold, :xp, greater_than_or_equal_to: 0
  # attr_reader :gloomhaven_player
  attr_reader :deck

  after_initialize :set_deck

  private
  
  def set_deck
    return unless persisted? 

    gloomhaven_player = Gloomhaven::Player.new(name: name, character_class: character_class)
    perks.each do |perk|
      gloomhaven_player.add_perk!(Gloomhaven::Perk.new(perk))
    end

    @deck = gloomhaven_player.deck
    @deck.shuffle!
  end
end
