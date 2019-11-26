class PlansController < ApplicationController
  before_action :authenticate_user!
  def index
    @token = ExService.new(current_user, 144).open_order
  end

private

end