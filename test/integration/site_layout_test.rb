require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/search'
    assert_select "a[href=?]", root_path
  
    get mosaic_path
    assert_template 'static_pages/mosaic'
    
  end

end
