class StaticPagesController < ApplicationController
  def home
    @miniposts = Minipost.all
  end

  def help
  end
end
