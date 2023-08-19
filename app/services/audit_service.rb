# frozen_string_literal: true

class AuditService
  def self.call(object, user)
    return unless object.valid?

    audit = Audit.new(entity_id: object.id, entity_name: object.class.name,
                      changed_data: object.changes.to_json, user: user, changed_at: DateTime.now)

    return audit.save! if audit.valid?

    false
  end
end
