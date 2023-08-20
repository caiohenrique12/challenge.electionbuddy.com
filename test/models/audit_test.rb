# frozen_string_literal: true

require 'test_helper'

class AuditTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @election = elections(:one)
    @audit = Audit.create!(user: @user, entity_name: 'Election', entity_id: @election.id)
  end

  # Testing Scopes
  test 'should return audits by elections' do
    assert_includes Audit.by_elections, @audit
  end

  test 'should return audits by entity name and ids' do
    assert_includes Audit.by_entity_name_and_ids(@election.id, 'Election'), @audit
  end

  # Testing Delegates
  test 'should delegate email to user' do
    assert_equal @user.email, @audit.user_email
  end

  test 'should delegate name to election' do
    assert_equal @election.name, @audit.election_name
  end

  # Testing instance methods
  test 'should return correct election' do
    assert_equal @election, @audit.election
  end

  test 'should show correct changed_data_info' do
    @audit.changed_data = '{}'
    assert_equal 'Not changed yet', @audit.changed_data_info

    @audit.changed_data = '{"key": "value"}'
    assert_equal '{"key": "value"}', @audit.changed_data_info
  end
end
