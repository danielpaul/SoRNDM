class HomeController < ApplicationController

  def index
  end

  def champion
    @value = gen_champion
  end

  private

  def gen_champion
    Faker::Name.name
  end

end
