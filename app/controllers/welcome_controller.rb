class WelcomeController < ApplicationController
  def index


  end
  def login
    render layout: 'guest'
  end
  def register
    render layout: 'guest'
  end
end