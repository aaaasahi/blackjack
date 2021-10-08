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