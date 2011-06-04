class Mp3 < ActiveRecord::Base

def count_reviews
  self.reviews.all.count
end

# returns the average rating for that mp3
def avg_reviews
  @avg = self.reviews.average(:rating)     
  @avg ? @avg : 0
end

  validates :url,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
                 
  has_many :reviews

  scope :by_artist, lambda {|artist| where(:artist => artist) unless artist.nil? }
  scope :by_rating, lambda {|rating| where(:score => (rating)..('5')) }

                    end
