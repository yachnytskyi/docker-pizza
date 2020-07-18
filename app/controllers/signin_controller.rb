class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]


end
