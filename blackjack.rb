require "./deck.rb"
require "./card.rb"
require "./user.rb"
require "./dealer.rb"
require "./message.rb"

#ゲーム進行
class Blackjack

  include Message

  def game_start
  
    start_msg

    deck = Deck.new
    user = User.new
    dealer = Dealer.new

    #手札配る、手札表示
    user.user_first_draw_card(deck) 
    dealer.dealer_first_draw(deck)

    #ユーザーターン
      #Hitならもう一枚引く、スタンドならループ抜ける
      while true

        select_msg

        #行動選択
        select_num = gets.to_i
        if select_num == 1
          user.draw(deck)
          user.show_hand
          
          if user.cal_score_user >= 22
            burst_msg
            return 
          end
        elsif select_num == 2
          break
        else
          error_msg
        end

      end

      #ディーラーターン
      #17以上になるまで引く
      while true 
        if dealer.cal_score_dealer <= 17
            dealer.draw(deck)
        else
            break
        end
      end
      user.show_hand
      dealer.show_hand
      judge(user, dealer)

  end

  
  def judge(user, dealer)
    user_score = user.cal_score_user
    dealer_score = dealer.cal_score_dealer
    if  user_score == dealer_score
      draw_msg
    elsif user_score == 21
      blackjack_msg
    elsif dealer_score >= 22
      dealer_burst_msg
    elsif dealer_score > user_score
      user_lose_msg
    else
      user_win_msg
    end
  end
end