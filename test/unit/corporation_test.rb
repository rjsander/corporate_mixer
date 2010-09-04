require 'test_helper'

class CorporationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Corporation.new.valid?
  end
end
