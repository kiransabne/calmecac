class CourseBuilder
  constructor: () ->
    @addModuleLink = $("#add-module")
    @currentSectionIndex = 0

  init: () ->
    @addModuleLink.on "click", (e) =>
      e.preventDefault()
      e.stopPropagation()

      @addModuleLink.prepend(_newSection)

  _newSection: () ->
    "<div><label>Name</label><input name='course[section][" + @currentSectionIndex + "][name]' id='course_section_" + @currentSectionIndex + "_name'></div>"
