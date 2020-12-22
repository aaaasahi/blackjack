require "./deck.rb"
require "./card.rb"
require "./user.rb"
require "./dealer.rb"

#ゲーム進行
class Blackjack

    def game_start

        puts <<~TEXT

        =======================

        Welcome to Blackjack!!!

        =======================

        TEXT



        deck = Deck.new
        user = User.new
        dealer = Dealer.new


        #手札配る、手札表示
        user.user_first_draw_card(deck) 
        dealer.dealer_first_draw(deck)

        #ユーザーターン

        #Hitならもう一枚引く、スタンドならループ抜ける
        while true
            puts <<~TEXT
        
            どうしますか？

            1.Hit(カードを引く)　 2.Stand(今の手札で勝負)
        
            TEXT

            #行動選択
            select_num = gets.to_i

            if select_num == 1
                user.draw(deck)
                user.show_hand
                
                if user.cal_score_user >= 22
                    burst
                    return 
                end

            elsif select_num == 2
                break
            else
                puts "　1 or 2 を入力してください。　"
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
            puts "同点なので引き分けです。"

        elsif user_score == 21
            puts "ブラックジャック！！ あなたの勝ちです！"

        elsif dealer_score >= 22
            puts "ディーラーがバーストしました。あなたの勝ちです！"

        elsif dealer_score > user_score
            puts "ディーラーの勝ちです！"
        else
            puts "あなたの勝ちです！"
        end
    end

    def burst
        puts "バースト！！"
        puts "合計点数が21を超えたのであなたの負けです。"
    end
end