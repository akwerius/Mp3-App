module Mp3sHelper
def add_review_link(mp3) 
	link_to_function "mp3" do |page|
		page.insert_html :bottom, :reviews, :partial => 'mp3s/review', :object => Review.new
	end 
end
end
