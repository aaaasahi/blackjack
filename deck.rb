#山札作成、シャフル、ドロー
class Deck
    #山札用の空の配列を用意
    def initialize
      @cards = []
    end

    #山札作成、シャッフル
    def create
      mark = ["ハート","クローバー","ダイヤ","スペード"]
      number = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
      mark.each do |mark|
          number.each do |number|
              card = Card.new(mark,number)
              @cards << card
          end
      end
      @cards.shuffle!
    end

    #山札から1枚引く
    def draw
      @cards.pop
    end
end

