#カード情報
class Card
  attr_reader :mark,:number
  #カードオブジェクトの値受け取り
  def initialize(mark,number)
    @mark = mark
    @number = number
  end

  #カード情報表示
  def info
    return "#{@mark}の#{@number}"
  end
  
  #スコア計算方法
  def score
    if @nunmber == "J" || @number == "Q" || @number == "K"
        @nunmber = 10
    elsif @number == "A"
        @number = 1
    else
        @number.to_i
    end
  end
end