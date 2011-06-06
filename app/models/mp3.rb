class Mp3 < ActiveRecord::Base

def count_reviews
  self.reviews.all.count
end

# returns the average rating for that mp3
def avg_reviews
  @avg = self.reviews.average(:rating)     
  @avg ? @avg : 0
end


after_update :save_reviews

def save_reviews 
	reviews.each do |review|
	review.save(false) 
	end
end

  has_many :reviews

  validates :url,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates_associated :reviews

  scope :by_artist, lambda {|artist| where(:artist => artist) unless artist.empty? }
  scope :by_rating, lambda {|rating| where(:score => (rating)..('5')) unless rating.empty? }


                    end
