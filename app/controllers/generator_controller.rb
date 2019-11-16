class GeneratorController < ApplicationController

  before_action :set_global_variables!, :check_if_allowed!

  def index
    # /generate/games/league-of-legends/champion
    @string = "Faker::#{@category.capitalize}::#{parse_topic(@topic)}.#{@type}"

    @random = eval(@string)

    respond_to do |format|
     format.html
     format.json {
       render json: {
         text: @random
       }
     }
   end

  end

  private

    def set_global_variables!
      @category = params[:category]
      @topic = params[:topic]
      @type = params[:type]
    end

    def check_if_allowed!
      # if any above is missing, render 404
      allowed_category = allowed_params[@category.to_sym]
      allowed_topic = allowed_category[@topic.to_sym] if allowed_category
      allowed_type = allowed_topic&.include?(@type)

      raise ActionController::RoutingError.new('Not Found') and return if !allowed_type
    end

    def allowed_params
      {
        games: {
          'league-of-legends': ['champion'],
          'age-of-empires': ['names']
        },
        asdfad: {

        }
      }
    end

    def parse_topic(topic)
      topic.gsub!('-', ' ').titleize.gsub!(' ', '')
    end

end
