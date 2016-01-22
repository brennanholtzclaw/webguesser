require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = 10
SecretMessage = "The Secret Number is #{NUMBER}"
high_message = "Too High!"
low_message = "Too Low!"

def check_guess(guess)
  if (guess - 5) > NUMBER
    "Way Too High!"
  elsif guess > NUMBER
    "Too High!"
  elsif (guess + 5) < NUMBER
    "Way Too Low!"
  elsif guess < NUMBER
    "Too Low!"
  else
    "GOOD JOB! #{guess} is the correct answer! \n" + "#{SecretMessage}"
  end
end

# :secret_message => secret_message,
# :high_message => high_message,
# :low_message => low_message

get '/' do

  guess = params["guess"]
  message = check_guess(guess.to_i)
  erb :index, :locals => {:number => NUMBER,
                          :message => message}


end
