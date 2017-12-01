data = CourseBuilder.create "Dynamics of the Spacetime Continuum" do
  description "How the Spacetime Continuum works? In this course will see through all the mysterios of the matter."
  objective "Understand the basic of QED"
  objective "QED with differente metrics"

  section "QED: 101" do
    resource "Quantum Field Theory" do
      link "https://www.youtube.com/watch?v=j-BznRQbT4Y"
    end

    resource "Quantum Electrodynamics" do
      link "https://www.youtube.com/watch?v=hHTWBc14-mk"
    end

    activity "Physics of Fields" do
      description "Please read the following paper"
      url "https://arxiv.org/pdf/1609.01496.pdf"
      question "How does the quantized massless Klein-Gordon field works on the Politzer spacetime?"
    end

    exam do
      description "Please review the resources and activies given before."
      question "How can we cheat quantum communication with backward time-steps?"
      question "Is it possible to create a non-negative metric that allow us quantum communication at room temperature?"
    end
  end
end

Course.create data
