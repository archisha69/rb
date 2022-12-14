require "discordrb"
require "cmath"
require "subprocess"
require "base16"

rb_bot = Discordrb::Commands::CommandBot.new token: <token>, client_id: <id>, prefix: "<prefix>"

# complex (basic)
rb_bot.command :sum, min_args: 2 do |event, *args| #sum
  event.respond args.collect(&:to_c).inject(&:+).to_s
end

rb_bot.command :sub, min_args: 2 do |event, *args| #subtract
  event.respond args.collect(&:to_c).inject(&:-).to_s
end

rb_bot.command :mul, min_args: 2 do |event, *args| #multiply
  event.respond args.collect(&:to_c).inject(&:*).to_s
end

rb_bot.command :div, min_args: 2 do |event, *args| #divide
  event.respond args.collect(&:to_c).inject(&:/).to_s
end

# complex (normal)
rb_bot.command :sqrt do |event, *arg| #square root
  event.respond CMath.sqrt(arg.join(" ").to_c).to_s
end

rb_bot.command :cbrt do |event, *arg| #cube root
  event.respond CMath.cbrt(arg.join(" ").to_c).to_s
end

rb_bot.command :abs do |event, *arg| #absolute value
  event.respond arg.to_c.abs().to_s
end

rb_bot.command :log do |event, base, *arg| #logarithm
  event.respond CMath.log(arg.join(" ").to_c, base.to_f).to_s
end

rb_bot.command :ln do |event, *arg| #natural logarithm
  event.respond CMath.log(arg.join(" ").to_c, Math::E).to_s
end

rb_bot.command :exp do |event, *arg| #exponential function
  event.respond CMath.exp(arg.join(" ").to_c).to_s
end

# complex (trigonometry)
rb_bot.command :sin do |event, *arg| #sine
  event.respond CMath.sin(arg.join(" ").to_c).to_s
end

rb_bot.command :cos do |event, *arg| #cosine
  event.respond CMath.cos(arg.join(" ").to_c).to_s
end

rb_bot.command :tan do |event, *arg| #tangent
  event.respond CMath.tan(arg.join(" ").to_c).to_s
end

rb_bot.command :sinh do |event, *arg| #hyperbolic sine
  event.respond CMath.sinh(arg.join(" ").to_c).to_s
end

rb_bot.command :cosh do |event, *arg| #hyperbolic cosine
  event.respond CMath.cosh(arg.join(" ").to_c).to_s
end

rb_bot.command :tanh do |event, *arg| #hyperbolic tangent
  event.respond CMath.tanh(arg.join(" ").to_c).to_s
end

rb_bot.command :arcsinh do |event, *arg| #inverse hyperbolic sine
  event.respond CMath.asinh(arg.join(" ").to_c).to_s
end

rb_bot.command :arccosh do |event, *arg| #inverse hyperbolic cosine
  event.respond CMath.acosh(arg.join(" ").to_c).to_s
end

rb_bot.command :arctanh do |event, *arg| #inverse hyperbolic tangent
  event.respond CMath.atanh(arg.join(" ").to_c).to_s
end

rb_bot.command :arcsin do |event, *arg| #arc sine
  event.respond CMath.asin(arg.join(" ").to_c).to_s
end

rb_bot.command :arccos do |event, *arg| #arc cosine
  event.respond CMath.acos(arg.join(" ").to_c).to_s
end

rb_bot.command :arctan do |event, *arg| #arc tangent
  event.respond CMath.atan(arg.join(" ").to_c).to_s
end

# calculus
rb_bot.command :derivative do |event, *arg| #derivatives
  event.respond Subprocess.check_output(["python", "q.py", "d", arg.join(" ")])
end
  
rb_bot.command :integral do |event, *arg| #integrals
  event.respond Subprocess.check_output(["python", "q.py", "i", arg.join(" ")])
end

#rb_bot.command :graph do |event, *arg| #graphs
#  Subprocess.run(["python", "q.py", "g", arg.join(" ")])
  #file
#end

# archiescript enc + dec
rb_bot.command :encode do |event, *arg| #encode
  event.respond Subprocess.check_output(["python", "q.py", "e", arg.join(" ")])
end

rb_bot.command :decode do |event, *arg| #decode
  event.respond Subprocess.check_output(["python", "q.py", "de", arg.join(" ")])
end

rb_bot.command :cexec do |event, *arg| #cexecute
  event.respond Subprocess.check_output(["python", "q.py", "c", arg.join(" ")])
end

rb_bot.run
rb_bot.join
