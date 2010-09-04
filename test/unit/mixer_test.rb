require 'test_helper'

class MixerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Mixer.new.valid?
  end
end
