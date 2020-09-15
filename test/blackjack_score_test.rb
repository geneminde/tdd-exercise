require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do
    hand = ['King', 'Queen']
    score = blackjack_score(hand)
    expect(score).must_equal 20

    hand = ['Jack', 2, 9]
    score = blackjack_score(hand)
    expect(score).must_equal 21
  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ['Ace', 2, 3]
    score = blackjack_score(hand)
    expect(score).must_equal 16

    hand = ['King', 'Ace']
    score = blackjack_score(hand)
    expect(score).must_equal 21

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = ['Ace', 9, 9]
    score = blackjack_score(hand)
    expect(score).must_equal 19

    hand = ['Ace', 'Ace', 9, 9]
    score = blackjack_score(hand)
    expect(score).must_equal 20

    hand = ['Jack', 'Queen', 'Ace']
    score = blackjack_score(hand)
    expect(score).must_equal 21

    hand = ['Ace', 'Ace', 'Ace', 'Ace']
    score = blackjack_score(hand)
    expect(score).must_equal 14

  end

  it 'raises an ArgumentError for invalid cards' do
    hand = [7, 2, 'ace']
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = []
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = [1, 2, 3, 4, 5]
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = [2, 2, 2, 2, 2, 2]
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do
    hand = ['King', 'King', 'King']
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = [10, 'King', 'Ace', 'Ace']
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = ['Ace', 10, 10, 10]
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = [8, 8, 8]
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

  end
end
