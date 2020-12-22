class User
    def initialize
        @user_hands = []
    end

    #最初に引く、手札公開
    def user_first_draw_card(deck)
        2.times do
            deck.create
            card = deck.draw
            @user_hands << card
        end

        puts "====あなたの手札======="

        @user_hands.each.with_index(1) do |user_hand, i|
            puts "#{i}枚目 : #{user_hand.info}"
        end 

        puts "あなたの合計点数は#{cal_score_user}です"

        puts "========================"

    end
        

        def cal_score_user
            user_score = 0
            @user_hands.each do |hand|
                user_score += hand.score
            end
            return user_score  #合計のスコアスコアを返す
        end

        #1枚引く
        def draw(deck)
            deck.create
            card = deck.draw
            @user_hands << card
        end

        #手札表示
        def show_hand
            puts ""
            puts "====あなたの手札======="

            @user_hands.each.with_index(1) do |user_hand, i|
                puts "#{i}枚目 : #{user_hand.info}"
            end 
            puts "あなたの合計点数は#{cal_score_user}です"

            puts "========================"
            puts ""
        end

        
end