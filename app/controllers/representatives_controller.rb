# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    parameter = params[:id]
    @rep = Representative.find(parameter)
  end
end
