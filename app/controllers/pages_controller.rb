class PagesController < ApplicationController
  def home
    @tasks = Task.accessible_by(current_ability).all
  end
end
