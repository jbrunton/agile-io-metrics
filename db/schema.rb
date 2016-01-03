# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151229095025) do

  create_table "moods", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.float    "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "survey_answers", force: :cascade do |t|
    t.integer  "survey_response_id"
    t.integer  "survey_question_id"
    t.integer  "mood_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "survey_answers", ["mood_id"], name: "index_survey_answers_on_mood_id"
  add_index "survey_answers", ["survey_question_id"], name: "index_survey_answers_on_survey_question_id"
  add_index "survey_answers", ["survey_response_id"], name: "index_survey_answers_on_survey_response_id"

  create_table "survey_questions", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "survey_template_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "survey_questions", ["survey_template_id"], name: "index_survey_questions_on_survey_template_id"

  create_table "survey_responses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "survey_responses", ["survey_id"], name: "index_survey_responses_on_survey_id"
  add_index "survey_responses", ["user_id"], name: "index_survey_responses_on_user_id"

  create_table "survey_templates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "survey_templates", ["organization_id"], name: "index_survey_templates_on_organization_id"

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.integer  "survey_template_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "surveys", ["survey_template_id"], name: "index_surveys_on_survey_template_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "teams", ["organization_id"], name: "index_teams_on_organization_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "unique_identifier"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
