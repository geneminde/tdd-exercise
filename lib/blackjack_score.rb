# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def tally_cards(hand)
  score = 0
  hand.each do |card|
    if card.class == String
      if %w[Jack Queen King].include?(card.capitalize)
        score += 10
      end
    else
      score += card
    end
  end
  return score
end

def valid_hand(hand)
  valid_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  hand.each do |element|
    raise ArgumentError if !valid_cards.include?(element)
  end
  raise ArgumentError if hand.length < 2 || hand.length > 5
end

def blackjack_score(hand)
  score = 0
  valid_hand(hand)
  if hand.include?('Ace')
    if hand.count('Ace') == 1
      hand.delete('Ace')
      if tally_cards(hand) <= 10
        score = tally_cards(hand) + 11
      else
        score = tally_cards(hand) + 1
      end
    else
      aces = hand.count('Ace')
      hand.delete('Ace')
      if (tally_cards(hand) + aces - 1) > 10
        score = tally_cards(hand) + aces
      else
        score = tally_cards(hand) + aces + 10
      end
    end
  else
    score = tally_cards(hand)
  end

  raise ArgumentError if score > 21
  return score

end

