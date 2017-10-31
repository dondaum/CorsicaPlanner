class WelcomeController < ApplicationController
before_action :authenticate_user!

  def index
  end

  def discover
  end

  def info
  end
end
