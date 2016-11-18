class Student < User
  has_one :student_teacher
  has_one :teacher, through: :student_teacher
end
