class ConditionsController < ApplicationController
  



  def show
  	@conditions = Condition.order('created_at').last
  end



end
