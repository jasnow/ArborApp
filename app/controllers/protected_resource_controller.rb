class ProtectedResourceController < ApplicationController
  before_action :require_login
end
