require 'test_helper'

class CorporationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Corporation.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Corporation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Corporation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to corporation_url(assigns(:corporation))
  end
  
  def test_edit
    get :edit, :id => Corporation.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Corporation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Corporation.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Corporation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Corporation.first
    assert_redirected_to corporation_url(assigns(:corporation))
  end
  
  def test_destroy
    corporation = Corporation.first
    delete :destroy, :id => corporation
    assert_redirected_to corporations_url
    assert !Corporation.exists?(corporation.id)
  end
end
