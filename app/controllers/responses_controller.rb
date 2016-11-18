class ResponsesController < ApplicationController
  def create
    begin
      user = User.find(params["responses"].first[1]["user_id"])
      survey = Survey.find(params["responses"].first[1]["survey_id"])
      teacher = find_teacher(survey, user)
      params[:responses].each do |question_id, response|
        r = Response.create!(user: user, survey: survey, answer_id: response["answer_id"], teacher: teacher, organization: survey.organization)
      end
      SurveyAssignment.find_by_user_id_and_survey_id(user.id, survey.id).update(complete: true)
      render json: { success: true, data:{} }, status: 201
    rescue
      render json: { success: false, errors: ["An error occured with your survey submission."]}, status: 500
    end
  end

  private

  def find_teacher(survey, user)
    response_teacher = nil
    if survey.organization.teachers.length
      survey.organization.teachers.each { |teacher| response_teacher = teacher if teacher.students.include?(user) }
    end
    response_teacher
  end
end
