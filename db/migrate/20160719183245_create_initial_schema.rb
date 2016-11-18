class CreateInitialSchema < ActiveRecord::Migration[5.0]
  def change
    create_table "activation_codes", force: :cascade do |t|
      t.string   "code",                         null: false
      t.boolean  "activated",    default: false, null: false
      t.integer  "license_id"
      t.integer  "teacher_id"
      t.integer  "user_id"
      t.boolean  "sent",        default: false
      t.datetime "activated_on"
      t.datetime "expires_on"
      t.datetime "created_at",                   null: false
      t.datetime "updated_at",                   null: false
      t.index ["license_id"], name: "index_activation_codes_on_license_id", using: :btree
      t.index ["teacher_id"], name: "index_activation_codes_on_teacher_id", using: :btree
      t.index ["user_id"], name: "index_activation_codes_on_user_id", using: :btree
    end

    create_table "app_markers", force: :cascade do |t|
      t.string   "page_name"
      t.string   "save_type"
      t.string   "marker"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "licenses", force: :cascade do |t|
      t.string   "name"
      t.integer  "organization_id"
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.index ["organization_id"], name: "index_licenses_on_organization_id", using: :btree
    end

    create_table "organizations", force: :cascade do |t|
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

    create_table "users", force: :cascade do |t|
      t.string   "email",                  default: "",      null: false
      t.string   "encrypted_password",     default: "",      null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.integer  "sign_in_count",          default: 0,       null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.string   "name"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "role",                     default: "Student", null: false
      t.boolean  "eat_smart",              default: false,   null: false
      t.boolean  "legacy_password",        default: false,   null: false
      t.datetime "created_at",                               null: false
      t.datetime "updated_at",                               null: false
      t.string   "provider",               default: "email", null: false
      t.string   "uid",                    default: "",      null: false
      t.text   "tokens"
      t.string   "nickname",               default: ""
      t.string   "image",                  default: ""
      t.index ["email"], name: "index_users_on_email", using: :btree
      t.index ["uid", "provider"], unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    end

    create_table "viewer_logs", force: :cascade do |t|
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
end
