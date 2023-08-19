# frozen_string_literal: true

class Audit < ApplicationRecord
  belongs_to :user

  scope :by_elections, -> { where(entity_name: 'Election').order(changed_at: :desc) }

  delegate :email, to: :user, prefix: true
  delegate :name, to: :election, prefix: true

  def election
    Election.find(entity_id)
  end
end
