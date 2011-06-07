require 'test_helper'

class Mp3Test < ActiveSupport::TestCase
  test "add empty mp3" do
  	mp3 = Mp3.new
    assert !mp3.save, "Saved empty mp3"
  end
  test "add empty artist" do
  	mp3 = Mp3.new
  	mp3.url = "http://be-at-ease.com/kwe/music/transmission.mp3"
  	mp3.title = "transmission"
    assert mp3.save, "Saved empty artist"
  end
  test "negative mp3 length" do
  	mp3 = Mp3.new
  	mp3.url = "http://be-at-ease.com/kwe/music/transmission.mp3"
  	mp3.length = -3
    assert !mp3.save, "Added negative length"
  end
  test "mp3 rating range" do
  	mp3 = Mp3.new
  	mp3.url = "http://be-at-ease.com/kwe/music/transmission.mp3"
	mp3.rate.rating = -1
    assert !mp3.save, "Saved negative rating"
  end

end
