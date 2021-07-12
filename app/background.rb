class Background
  def initialize
    @img = "assets/Background/starBackground.png"
    @w = 254
    @h = 256
  end

  def tick(args)
    self.draw args
  end

  def draw(args)
    (0..5).each do |x|
     (0..4).each do |y|
        args.outputs.sprites <<  [
          (x * @w), (y * @h),
          @w, @h,
          @img
        ]
      end
    end
  end
end
