class PlansController < ApplicationController
  before_action :authenticate_user!
  def index
    ExService.new(current_user).open_order
  end

private

end