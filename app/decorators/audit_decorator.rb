# frozen_string_literal: true

class AuditDecorator
  def initialize(audit)
    @audit = audit
  end

  def questions
    records(ids: @audit.election.questions&.ids, entity_name: 'Question')
  end

  def answers
    question_ids = @audit.election.questions&.ids
    answer_ids = Answer.where(question_id: question_ids)
    records(ids: answer_ids, entity_name: 'Answer')
  end

  def voters
    records(ids: @audit.election.voters&.ids, entity_name: 'Voter')
  end

  private

  def records(ids:, entity_name:)
    Audit.by_entity_name_and_ids(ids, entity_name)
  end
end
