class RobotsController < ApplicationController

  def index
  end

  def run
    Request.send
    redirect_to root_path, flash: { success: "Requests successfully sent." }
  end

end
