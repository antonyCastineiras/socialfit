class Event < ApplicationRecord
  belongs_to :user
  has_many :invites, dependent: :destroy
  geocoded_by :postcode
  after_validation :geocode 

  acts_as_taggable
  acts_as_taggable_on :sports

  has_many :messages

  def name=(s)
    write_attribute(:name, s.to_s.titleize)
  end

  def info=(s)
    write_attribute(:info, s.to_s.capitalize)
  end

  def sport_list=(s)
    sports = s.split(" ")
    sports.each { |sport| sport_list.add(sport.downcase) if !sport_list.include?(sport.downcase) }
  end

  def organizer
  	user
  end

  def attending
  	invites.where("accepted = true").collect {|i| i.user }
  end

  def open_to_s
  	open ? 'open' : 'closed'
  end 
end
