require 'csv'
require 'pry'
require 'faker'

# Set this to true if you need to seed the user table
create_users = true

License.find_or_create_by(organization_id: 1, name: 'AVX LTD License')

if create_users
  puts "Seeding users table"
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'user.csv'))
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    u = User.new
    u.name = row['name']
    u.first_name = row['first_name']
    u.last_name = row['last_name']
    u.email = row['email']
    u.password = 'password'
    u.legacy_password = true
    if row['is_sys_admin'] == "1"
      u.role = "SuperAdmin"
    else
      u.role = %w(OrgAdmin Teacher Student).sample
    end
    u.save!
  end
end

puts "Seeding organizations table"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'organizations.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  o = Organization.new
  o.name = row['name']
  o.admins << User.find(row['admin_user'])
  o.address1 = row['address1']
  o.address2 = row['address2']
  o.city = row['city']
  o.state = row['state']
  o.zip_code = row['zip_code']
  o.save!
end

puts "Seeding activation codes table"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'activation_codes.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  new_teacher = Teacher.all.sample
  a = ActivationCode.new
  a.code = row['code']
  a.license = License.first
  a.activated = false
  a.teacher = new_teacher
  a.save!
end

puts "Creating surveys"
survey = Survey.find_or_create_by(name: "Awesome Survey 1", organization: Organization.first, position: 1)
4.times do
  q = Question.create(question: Faker::Lorem.sentence, organization: Organization.first)
  4.times do
    a = Answer.create(answer: Faker::Lorem.sentence, question: q)
  end
  survey.questions << q
end
User.find_by_email('test@test.com').surveys << survey

puts "Seeding App Markers"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'app_markers.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  am = AppMarker.new
  am.marker = row['marker']
  am.save!
end
