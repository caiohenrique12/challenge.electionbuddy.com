# frozen_string_literal: true

require 'test_helper'

class AuditsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @election = elections(:one)
    @question = questions(:one)
    @answer = answers(:one)
    @voter = voters(:one)
    @audit = Audit.create!(user: @user, entity_id: @election.id, entity_name: @election.class.name,
                           changed_at: DateTime.now)
    sign_in @user
  end

  test 'should get index' do
    get audits_url

    assert_response :success
  end
end
