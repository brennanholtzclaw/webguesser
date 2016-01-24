require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = 10
SecretMessage = "The Secret Number is #{NUMBER}"
high_message = "Too High!"
low_message = "Too Low!"
bgcolor = "FFFFFF"

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

  def color_check(letter)
    bg = {"T" => "F5A9A9", "W" => "FF0000", "G" => "01DF01"}
    bg[letter]
  end

get '/' do

  guess = params["guess"]
  message = check_guess(guess.to_i)
  bgcolor = color_check(message[0])
  erb :index, :locals => {:message => message,
                          :bg_color => bgcolor}

end
