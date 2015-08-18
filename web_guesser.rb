require 'sinatra'
require 'sinatra/reloader'

@@number  = rand(100)

get '/' do
  guess = params["guess"]
  message, color = check_guess(guess)
  erb :index, :locals => {:message => message, :color => color}
end

def check_guess(guess)
  if @@number > (guess.to_i + 5)
    ["Way too low!", "red"]
  elsif @@number < (guess.to_i - 5)
    ["Way too high!", "red"]
  elsif @@number < guess.to_i
    ["Too high!", "lightsalmon"]
  elsif @@number > guess.to_i
    ["Too low!", "lightsalmon"]
  else
    @@number == guess.to_i
    ["You got it right! The SECRET NUMBER is #{@@number}", "seagreen"]
  end
end