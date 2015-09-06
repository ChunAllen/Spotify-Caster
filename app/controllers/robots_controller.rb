class RobotsController < ApplicationController

  def index
  end

  def requests
    Tweet.requests
    redirect_to root_path, flash: { success: "Requests has been sent." }
  end

  def random_song
    Tweet.random_song
    redirect_to root_path, flash: { success: "Random song has been posted." }
  end

end
