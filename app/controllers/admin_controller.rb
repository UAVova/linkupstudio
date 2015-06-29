class AdminController < ApplicationController

  def index
    @tasks = Task.all
  end

end