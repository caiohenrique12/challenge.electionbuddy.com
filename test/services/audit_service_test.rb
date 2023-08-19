# frozen_string_literal: true

require 'test_helper'

class AuditServiceTest < ActionDispatch::IntegrationTest
  setup do
    @election = elections(:one)
    @user = users(:one)
  end

  test 'create audit for election' do
    @election.name = 'My election'

    result = AuditService.call(@election, @user)
    audit = Audit.find_by(entity_id: @election.id, entity_name: @election.class.name)

    assert_equal result, true
    assert JSON.parse(audit.changed_data), { 'name' => ['MyString', 'My election'] }
  end

  test 'when election is invalid' do
    @election.user_id = nil

    result = AuditService.call(@election, @user)

    assert_equal result, nil
  end
end
