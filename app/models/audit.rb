# frozen_string_literal: true

class Audit < ApplicationRecord
  belongs_to :user

  scope :by_elections, -> { where(entity_name: 'Election').order(changed_at: :desc) }
  scope :by_entity_name_and_ids, lambda { |_entity_id, entity_name|
    where(entity_id: ids, entity_name: entity_name).order(changed_at: :desc)
  }

  delegate :email, to: :user, prefix: true
  delegate :name, to: :election, prefix: true, allow_nil: true

  def election
    return if entity_id.nil?

    Election.find(entity_id)
  end

  def changed_data_info
    return 'Not changed yet' if changed_data == '{}'

    changed_data
  end
end
