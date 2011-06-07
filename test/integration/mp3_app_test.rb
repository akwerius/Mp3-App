require 'test_helper'

class Mp3AppTest < ActionDispatch::IntegrationTest
  fixtures :mp3s
  fixtures :reviews

  test "browse and create new mp3" do
    get "/mp3s"
    assert_response :success
 
    post_via_redirect "/new", :url => mp3s(:one).url, :title => mp3s(:one).title, :artist => mp3s(:one).artist, :length => mp3s(:one).length 
    assert_equal '/new', path
	
  end
  
  test "rate mp3" do

    get "/mp3s/1"
    assert_response :success
 
    post_via_redirect "/rate", :rating => reviews(:one).rating, :id => reviews(:one).mp3_id
    assert_equal '/mp3s/1', path
	
  end


end
