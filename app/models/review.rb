class Review < ActiveRecord::Base
  belongs_to :mp3
  validates :rating,  :presence => true
validates_inclusion_of :rating, :in => 1..5, :message => "can only be between 1 and 5."
validates_numericality_of :rating, :only_integer => true, :message => "can only be whole number."
end
