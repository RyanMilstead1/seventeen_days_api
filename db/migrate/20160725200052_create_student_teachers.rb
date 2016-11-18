class CreateStudentTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :student_teachers do |t|
      t.belongs_to :student, index: true
      t.belongs_to :teacher, index: true
      
      t.timestamps
    end
  end
end
