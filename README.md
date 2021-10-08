# ブラックジャック
Rubyの基礎文法を勉強後、知識定着のために初めて作成したRubyで動くブラックジャックゲームです。

# アプリ概要
ブラックジャックの以下の基本ルールを実装

1. ユーザーとディーラーがカード山札からカードを２枚ランダムで引きゲームスタート
2. ディーラーのカードのうち１枚は伏せられている
3. ユーザーは「ヒット」「スタンド」の行動を選択
4. ディーラーは17以上の数字になる様にカードを機械的に引き続ける
5. お互いの行動終了後、カードの数値を見せ合い、21に近い方が勝利
6. 21ちょうどの場合は「ブラックジャック」でユーザーの勝利

# インストールと使い方
```
git clone https://github.com/aaaasahi/blackjack.git
cd blackjack
ruby main.rb
```
ターミナルで実行。アプリのディレクトリ上でruby main.rbで実行。

# 工夫した点
### 実装前にマインドマップを作成することで実装する手順を明確にした。
<img width="958" alt="スクリーンショット 2021-10-08 9 05 18" src="https://user-images.githubusercontent.com/69437267/136481737-98e01515-193c-4d69-b629-9442fc2e7922.png">
実装する前に各クラスの役割と実装するメソッドをマインドマップにまとめました。

マインドマップにまとめることで、手順が明確になりスムーズに開発することができました。

### message部分を切り出すことで可読性の向上。
ゲームコントローラー部分である`blackjack.rb`内の出力メッセージを新しくmessage.rbに切り出すことで処理が分かりやすくなり可読性が上がりました。

blackjack.rb
```ruby
class Blackjack

  include Message

  def game_start
  
    start_msg

    deck = Deck.new
    user = User.new
    dealer = Dealer.new

    user.user_first_draw_card(deck) 
    dealer.dealer_first_draw(deck)

      #Hitならもう一枚引く、スタンドならループ抜ける
      while true

        select_msg

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
```

切り出したmessage.rb

```ruby
module Message
  def start_msg
    puts <<~TEXT
    =======================

    Welcome to Blackjack!!!

    =======================
    TEXT
  end

  def select_msg
    puts <<~TEXT
      どうしますか？

      1.Hit(カードを引く) 
      2.Stand(今の手札で勝負)

    TEXT
  end

  def burst_msg
    puts "バースト！！"
    puts "合計点数が21を超えたのであなたの負けです。"
  end

  def error_msg
    puts "1 or 2 を入力してください。"
  end

  def draw_msg
    puts "同点なので引き分けです。"
  end

  def blackjack_msg
    puts "ブラックジャック！！ あなたの勝ちです！"
  end

  def dealer_burst_msg
    puts "ディーラーがバーストしました。あなたの勝ちです！"
  end

  def user_lose_msg
    puts "ディーラーの勝ちです！"
  end

  def user_win_msg
    puts "あなたの勝ちです！"
  end
end
```
