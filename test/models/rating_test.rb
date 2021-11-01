require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'valid if score is between 0 and 10' do
    0.upto(10).each do |i|
      rating = Rating.new(score: i)
      rating.valid?
      assert_empty rating.errors[:score]
    end
  end

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

  test 'promoter? returns true if score is 9 or 10' do
    rating = Rating.new(score: 9)
    assert rating.promoter?
  end

  test 'promoter? returns false if score is less than 9' do
    rating = Rating.new(score: 1)
    assert_not rating.promoter?
  end

  test 'promoter? returns false if score is greater than 10' do
    rating = Rating.new(score: 11)
    assert_not rating.promoter?
  end
end
