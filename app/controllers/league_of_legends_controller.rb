class LeagueOfLegendsController < ApplicationController

  def index
  end

  def champion
    @value = gen_champion
  end

  private

  def gen_champion
    Faker::Games::LeagueOfLegends.champion
  end

end
