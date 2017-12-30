namespace :calmecac do
  desc "Creates goals for gamification"
  task :create_goals => :environment do |_t, args|
    # The Playground - 1 Section
    goal = Gamification::Goal.create

    goal.create_medal do |medal|
      medal.name = 'The Playground'
      medal.description = 'You know you way around kid!'
      medal.image = "/assets/the_playground_red.svg"
    end
    # The Spark - 10 Sections
    goal = Gamification::Goal.create

    goal.create_medal do |medal|
      medal.name = 'The Spark'
      medal.description = 'The force is strong with this one!'
      medal.image = "/assets/the_spark_red.svg"
    end
    # The Know-it-all - 30 Sections
    goal = Gamification::Goal.create

    goal.create_medal do |medal|
      medal.name = 'The Know-it-all'
      medal.description = "Great, kid. Don't get cocky"
      medal.image = "/assets/the_know_it_all_red.svg"
    end
    # The AI - 100 Sections
    goal = Gamification::Goal.create

    goal.create_medal do |medal|
      medal.name = 'The AI'
      medal.description = "The prophecy is true. You are the Chosen One."
      medal.image = "/assets/the_ai_red.svg"
    end
  end
end
