# frozen_string_literal: true

# test/decorators/audit_decorator_test.rb

require 'test_helper'

class AuditDecoratorTest < ActionDispatch::IntegrationTest
  def setup
    @election = elections(:one)
    @audit = Audit.create!(entity_id: @election.id, entity_name: @election.class.name, user: @election.user)
    @question = questions(:one)
    @answer = answers(:one)
    @voter = voters(:one)
    @audit_decorator = AuditDecorator.new(@audit)
  end

  test 'should return questions for audit' do
    Audit.create!(entity_id: @question.id, entity_name: @question.class.name, user: @election.user)

    assert_includes @audit_decorator.questions.pluck(:entity_id), @question.id
  end

  test 'should return empty array when dont have audited questions' do
    assert_empty @audit_decorator.questions
  end

  test 'should return answers for audit' do
    Audit.create!(entity_id: @answer.id, entity_name: @answer.class.name, user: @election.user)

    assert_includes @audit_decorator.answers.pluck(:entity_id), @answer.id
  end

  test 'should return empty array when dont have audited answers' do
    assert_empty @audit_decorator.answers
  end

  test 'should return voters for audit' do
    Audit.create!(entity_id: @voter.id, entity_name: @voter.class.name, user: @election.user)

    assert_includes @audit_decorator.voters.pluck(:entity_id), @voter.id
  end

  test 'should return empty array when dont have audited voters' do
    assert_empty @audit_decorator.voters
  end
end
