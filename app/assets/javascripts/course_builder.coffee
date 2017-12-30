class CourseBuilder
  constructor: () ->
    @addModuleLink = $("#add-module")
    @addResourceLink = $("#add-resource")
    @addActivityLink = $("#add-activity")
    @addQuestionLink = $("#add-question")
    @addExam = $("#add-exam")
    @modulesContainer = $("#modules")

  init: () ->
    @addModuleLink.on "click", (e) =>
      e.preventDefault()
      e.stopPropagation()

      @modulesContainer.prepend(@_newSection)

    $(document).on "click", "#add-resource", (e) =>
      e.preventDefault()
      e.stopPropagation()

      currentModule = $(e.target).attr('data-id')
      resources = $("#module-" + currentModule + " #add-resource")
      resources.prepend(@_newResource(currentModule))

    $(document).on "click", "#add-activity", (e) =>
      e.preventDefault()
      e.stopPropagation()

      currentModule = $(e.target).attr('data-id')
      activities = $("#module-" + currentModule + " #add-activity")
      activities.prepend(@_newActivity(currentModule))

    $(document).on "click", "#add-exam", (e) =>
      e.preventDefault()
      e.stopPropagation()

      currentModule = $(e.target).attr('data-id')
      exam = $("#module-" + currentModule + " #add-exam")
      exam.prepend(@_newExam(currentModule))

    $(document).on "click", "#add-question-to-activity", (e) =>
      e.preventDefault()
      e.stopPropagation()

      currentModule = $(e.target).attr('data-id')
      currentActivityUUID = $(e.target).attr('data-activity-id')
      currentActivity = $("#module-" + currentModule + " #activity-" + currentActivityUUID + " #add-question-to-activity")
      currentActivity.prepend(@_newQuestionForActivity(currentModule, currentActivityUUID))

    $(document).on "click", "#add-question-to-exam", (e) =>
      e.preventDefault()
      e.stopPropagation()

      currentModule = $(e.target).attr('data-id')
      currentExamUUID = $(e.target).attr('data-exam-id')
      currentExam = $("#module-" + currentModule + " #exam-" + currentExamUUID + " #add-question-to-exam")
      currentExam.prepend(@_newQuestionForExam(currentModule, currentExamUUID))

  _newSection: () =>
    uuid = @_uuid()
    return "<div id='module-" + uuid + "'><label class='registration-container__label'>Module name</label><br><input class='registration-container__input' name='course[sections][" + uuid + "][name]' id='course_sections_" + uuid + "_name' placeholder='Module name'><div class='resources'><a class='button-link' href='#' id='add-resource' data-id='" + uuid + "'>Add Resource</a></div><div class='activities'><a class='button-link' href='#' id='add-activity' data-id='" + uuid + "'>Add Activity</a></div><div class='exam'><a class='button-link' href='#' id='add-exam' data-id='" + uuid + "'>Add Exam</a></div></div>"

  _newResource: (currentModule) =>
    uuid = @_uuid()
    return "<div id='resource-" + uuid + "'><input class='registration-container__input' name='course[sections][" + currentModule + "][resources][" + uuid + "][name]' id='course_sections_" + currentModule + "_resources_" + uuid + "_name'/ placeholder='Resource name'><input class='registration-container__input' name='course[sections][" + currentModule + "][resources][" + uuid + "][link]' id='course_sections_" + currentModule + "_resources_" + uuid + "_link'/ placeholder='Resource link'></div>"

  _newActivity: (currentModule) =>
    uuid = @_uuid()
    return "<div id='activity-" + uuid + "'><input class='registration-container__input' name='course[sections]" + currentModule + "][activities][" + uuid + "][name]' id='course_sections_" + currentModule + "_activities_" + uuid + "_name'/ placeholder='Activity name'><input class='registration-container__input' name='course[sections]" + currentModule + "][activities][" + uuid + "][description]' id='course_sections_" + currentModule + "_activities_" + uuid + "_description' placeholder='Activity resource'/><input class='registration-container__input' name='course[sections][" + currentModule + "][activities][" + uuid + "][url]' id='course_sections_" + currentModule + "_activities_" + uuid + "_url' placeholder='Activity link'/><div class='questions'><a class='button-link' href='#' id='add-question-to-activity' data-id='" + currentModule + "' data-activity-id='" + uuid + "'>Add Question</a></div></div>"

  _newQuestionForActivity: (currentModule, currentActivity) =>
    uuid = @_uuid()
    return "<div id='question-'" + uuid + "'><input class='registration-container__input' name='course[sections][" + currentModule + "][activities][" + currentActivity + "]questions[" + uuid + "]' id='course_sections_" + currentModule + "_activities_" + currentActivity + "_questions_" + uuid + "' placeholder='Activity question'/></div>"

  _newQuestionForExam: (currentModule, currentExam) =>
    uuid = @_uuid()
    return "<div id='question-'" + uuid + "'><input class='registration-container__input' name='course[sections][" + currentModule + "][exam][" + currentExam + "]questions[" + uuid + "]' id='course_sections_" + currentModule + "_exam_" + currentExam + "_questions_" + uuid + "' placeholder='Exam question'/></div>"

  _newExam: (currentModule) =>
    uuid = @_uuid()
    return "<div id='exam-" + uuid + "'><input class='registration-container__input' name='course[sections]" + currentModule + "][exam][" + uuid + "][description]' id='course_sections_" + currentModule + "_exam_" + uuid + "_description' placeholder='Exam description'/><div class='questions'><a href='#' id='add-question-to-exam' data-id='" + currentModule + "' data-exam-id='" + uuid + "'>Add Exam question</a></div></div>"

  _uuid: () ->
    d = (new Date).getTime()

    uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) ->
      r = (d + Math.random() * 16) % 16 | 0
      d = Math.floor(d / 16)
      (if c == 'x' then r else r & 0x3 | 0x8).toString 16
    )

    uuid

$ ->
  window.courseBuilder = CourseBuilder
  return
