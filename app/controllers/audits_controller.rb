# frozen_string_literal: true

class AuditsController < ApplicationController
  before_action :authenticate_user!

  def index
    @audits = Audit.by_elections
  end

  def show
    @audit = Audit.find(params[:id])
  end
end
