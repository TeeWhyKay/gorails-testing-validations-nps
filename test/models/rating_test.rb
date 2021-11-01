require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'invalid if score is less than 0' do
    rating = Rating.new(score: -1)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end
  test 'invalid if score is more than 10' do
    rating = Rating.new(score: 11)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end
end
