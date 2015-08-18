require 'sinatra'
require 'sinatra/reloader'

@@number  = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => @@number, :message => message}
end

def check_guess(guess)
  if @@number > (guess.to_i + 5)
    message = "Way too low!"
  elsif @@number < (guess.to_i - 5)
    message = "Way too high!"
  elsif @@number < guess.to_i
    message =  "Too high!"
  elsif @@number > guess.to_i
    message = "Too low!"
  else
    @@number == guess.to_i
    message = "You got it right! The SECRET NUMBER is #{@@number}"
  end
end