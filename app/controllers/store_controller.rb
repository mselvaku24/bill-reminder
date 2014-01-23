class StoreController < ApplicationController
  def index
    if session[:numTimes].nil?
      session[:numTimes] = 1
    else
      session[:numTimes] += 1
    end
    @companies = Company.all
    @num_times = session[:numTimes]
  end
end
