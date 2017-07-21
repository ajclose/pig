class Player
  attr_reader :score, :name, :wins, :losses

  def initialize(name)
    @name = name
    @score = 0
    @wins = 0
    @losses = 0
  end

  def start_game
    @score = 0
  end

  def start_turn
    @turn_score = 0
    @turn_over = false
  end

  def record_roll(roll)
    if roll == 1
      @turn_score = 0
      @turn_over = true
    else
      @turn_score += roll
    end
  end

  def end_turn
    @score += @turn_score
  end

  def end_game
    if score >= 100
      @wins += 1
    else
      @losses += 1
    end
  end

  def roll_again?
    !@turn_over
  end
end

class CautiousPlayer < Player
  def roll_again?
    super && @turn_score < 2
  end
end

class CautiousPlayer2 < Player
  def roll_again?
    if @turn_score == 0
      super
    else
      random = rand
      super && random > 0.5
    end
  end
end

class StrategicPlayer < Player
  def roll_again?
    super && @turn_score < 5
  end
end

class StrategicPlayer2 < Player
  def roll_again?
    if score > 75
      super && @turn_score < 3
    else
      super && @turn_score < 10
    end
  end
end
