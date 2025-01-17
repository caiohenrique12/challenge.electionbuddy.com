# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_230_819_012_420) do
  create_table 'answers', force: :cascade do |t|
    t.string 'name'
    t.integer 'question_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'audits', force: :cascade do |t|
    t.integer 'entity_id'
    t.string 'entity_name'
    t.text 'changed_data'
    t.integer 'user_id', null: false
    t.datetime 'changed_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_audits_on_user_id'
  end

  create_table 'elections', force: :cascade do |t|
    t.string 'name'
    t.datetime 'start_at'
    t.datetime 'end_at'
    t.json 'settings'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_elections_on_user_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'name'
    t.integer 'election_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['election_id'], name: 'index_questions_on_election_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'voters', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.integer 'election_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['election_id'], name: 'index_voters_on_election_id'
  end

  add_foreign_key 'audits', 'users'
end
