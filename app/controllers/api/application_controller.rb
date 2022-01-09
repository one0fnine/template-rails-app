class Api::ApplicationController < ActionController::API
  include Rescueable
  include PathFetchable

  before_action :authenticate_account!
end
