class Teacher < User
  has_many :student_teachers
  has_many :students, through: :student_teachers
end
