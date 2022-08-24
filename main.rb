require "discordrb"

rb_bot = Discordrb::Commands::CommandBot.new token: <token>, client_id: <id>, prefix: "<prefix>"

#commands
rb_bot.command :sum, min_args: 2 do |event, *args|
  event.respond args.collect(&:to_f).inject(&:+).to_s
end

rb_bot.command :subtract, min_args: 2 do |event, *args|
  event.respond args.collect(&:to_f).inject(&:-).to_s
end

rb_bot.command :multiply, min_args: 2 do |event, *args|
  event.respond args.collect(&:to_f).inject(&:*).to_s
end

rb_bot.command :divide, min_args: 2 do |event, *args|
  event.respond args.collect(&:to_f).inject(&:/).to_s
end

rb_bot.command :absolute, min_args: 1 do |event, *args|
  event.respond args.collect(&:to_f).abs().to_s
end

rb_bot.command :sin, min_args: 1 do |event, *args|
  event.respond Math.sin(args.collect(&:to_f)).to_s
end



rb_bot.run
rb_bot.join
