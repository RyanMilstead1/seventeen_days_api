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

ActiveRecord::Schema.define(version: 20161026213102) do

  create_table "activation_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code",                                    null: false
    t.boolean  "activated",    default: false,            null: false
    t.integer  "license_id"
    t.integer  "teacher_id"
    t.integer  "user_id"
    t.boolean  "sent",         default: false
    t.datetime "activated_on"
    t.datetime "expires_on"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "app_type",     default: "seventeen_days"
    t.index ["license_id"], name: "index_activation_codes_on_license_id", using: :btree
    t.index ["teacher_id"], name: "index_activation_codes_on_teacher_id", using: :btree
    t.index ["user_id"], name: "index_activation_codes_on_user_id", using: :btree
  end

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "answer"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "app_markers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "marker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "count"
    t.index ["organization_id"], name: "index_licenses_on_organization_id", using: :btree
  end

  create_table "organization_admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "admin_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["admin_id"], name: "index_organization_admins_on_admin_id", using: :btree
    t.index ["organization_id"], name: "index_organization_admins_on_organization_id", using: :btree
  end

  create_table "organization_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.integer  "teacher_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_organization_teachers_on_organization_id", using: :btree
    t.index ["teacher_id"], name: "index_organization_teachers_on_teacher_id", using: :btree
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "question"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_questions_on_organization_id", using: :btree
  end

  create_table "responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.integer  "survey_id"
    t.integer  "organization_id"
    t.integer  "teacher_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["answer_id"], name: "index_responses_on_answer_id", using: :btree
    t.index ["organization_id"], name: "index_responses_on_organization_id", using: :btree
    t.index ["survey_id"], name: "index_responses_on_survey_id", using: :btree
    t.index ["teacher_id"], name: "index_responses_on_teacher_id", using: :btree
    t.index ["user_id"], name: "index_responses_on_user_id", using: :btree
  end

  create_table "student_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_teachers_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_student_teachers_on_teacher_id", using: :btree
  end

  create_table "survey_assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "complete",   default: false
    t.index ["survey_id"], name: "index_survey_assignments_on_survey_id", using: :btree
    t.index ["user_id"], name: "index_survey_assignments_on_user_id", using: :btree
  end

  create_table "survey_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "survey_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_survey_questions_on_question_id", using: :btree
    t.index ["survey_id"], name: "index_survey_questions_on_survey_id", using: :btree
  end

  create_table "surveys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "days_until_show"
    t.index ["organization_id"], name: "index_surveys_on_organization_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "",               null: false
    t.string   "encrypted_password",                   default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                        default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                                 default: "Student",        null: false
    t.boolean  "legacy_password",                      default: false,            null: false
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.string   "provider",                             default: "email",          null: false
    t.string   "uid",                                  default: "",               null: false
    t.text     "tokens",                 limit: 65535
    t.string   "nickname",                             default: ""
    t.string   "image",                                default: ""
    t.string   "position",                             default: "openpreview"
    t.boolean  "jessicas_room",                        default: false
    t.string   "app_type",                             default: "seventeen_days"
    t.string   "current_file"
    t.integer  "current_file_time",                    default: 0
    t.string   "current_key"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "viewer_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "action"
    t.string   "marker"
    t.integer  "user_id"
    t.integer  "app_marker_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["app_marker_id"], name: "index_viewer_logs_on_app_marker_id", using: :btree
    t.index ["user_id"], name: "index_viewer_logs_on_user_id", using: :btree
  end

end
