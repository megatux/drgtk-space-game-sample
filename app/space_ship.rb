class SpaceShip
  attr_accessor :x, :y

  def initialize(settings)
    @x = settings[:x] || 10
    @y = settings[:y] || 10
    @moving_left = @moving_right = false
    @speed = 2
  end

  def tick(args)
    self.draw args
  end

  def draw(args)
    args.outputs.sprites <<  [
      @x, @y,
      64, 64,
      image
    ]
  end

  def image
    if @move_left
      "assets/playerLeft.png"
    elsif @move_right
      "assets/playerRight.png"
    else
      "assets/player.png"
    end
  end

  def handle_input(inputs)
    if inputs.keyboard.key_held.up && can_move_up?
      self.move_up
    end

    if inputs.keyboard.key_held.down && can_move_down?
      self.move_down
    end

    if inputs.keyboard.key_held.left && can_move_left?
      self.move_left
      @move_left = true
      @move_right = false
    elsif inputs.keyboard.key_held.right && can_move_right?
      self.move_right
      @move_right = true
      @move_left = false
    else
      @move_right = @move_left = false
    end
  end

  def can_move_left?
    @x > 10
  end

  def can_move_right?
    @x < 1200
  end

  def can_move_up?
    @y < 650
  end

  def can_move_down?
    @y > 10
  end

  def move_down
    @y -= @speed
  end

  def move_up
    @y += @speed
  end

  def move_left
    @x -= @speed
  end

  def move_right
    @x += @speed
  end

  def to_s
    "(x:#{x} y:#{@y})"
  end
end
