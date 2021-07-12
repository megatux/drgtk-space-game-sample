require 'app/space_ship.rb'
require 'app/background.rb'

def tick(args)
  init_state(args)
  handle_input(args)
  print_info args

  args.state.background.tick args
  args.state.space_ship.tick args
end

def init_state(args)
  args.state.space_ship ||= SpaceShip.new(x: 20, y: 20)
  args.state.background ||= Background.new
end

def handle_input(args)
  exit if args.inputs.keyboard.key_down.escape

  # Pressing r will reset the application
  if args.inputs.keyboard.key_down.r
    args.gtk.reset
    reset
    return
  end

  # args.state.space_ship.move_up if args.inputs.keyboard.up
  # args.state.space_ship.move_up if args.inputs.keyboard.key_down.up
  # args.state.space_ship.move_up if args.inputs.keyboard.key_up.up

  args.state.space_ship.handle_input args.inputs

  # args.inputs.keyboard.key.clear
  # args.inputs.keyboard.key_down.clear
  # args.inputs.keyboard.key_up.clear
  # args.inputs.keyboard.key_held.clear
end

def print_info(args)
  text = args.state.space_ship.to_s
  args.outputs.labels << [10, 700, text, 10, 0, 255, 25, 25]
end
