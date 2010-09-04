require 'test_helper'

class MixersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Mixer.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Mixer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Mixer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to mixer_url(assigns(:mixer))
  end
  
  def test_edit
    get :edit, :id => Mixer.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Mixer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Mixer.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Mixer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Mixer.first
    assert_redirected_to mixer_url(assigns(:mixer))
  end
  
  def test_destroy
    mixer = Mixer.first
    delete :destroy, :id => mixer
    assert_redirected_to mixers_url
    assert !Mixer.exists?(mixer.id)
  end
end
