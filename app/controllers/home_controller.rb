class HomeController < ApplicationController
  def index
    @teams = Team.limit(10)

    @players = Player.limit(10)
  end
end
