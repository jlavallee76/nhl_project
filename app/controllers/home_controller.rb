class HomeController < ApplicationController
  def index
    @teams = Team.all

    @players = Player.limit(10)
  end
end
