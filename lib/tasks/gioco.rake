# -*- encoding: utf-8 -*-

namespace :gioco do
  desc "Used to add a new badge at Gioco scheme"

  task :add_badge, %i[name points kind default] => :environment do |_t, args|
    arg_default = args.default ? eval(args.default) : false

    if !args.name || !args.points || !args.kind
      raise "There are missing some arguments"
    else
      badge_string = "kind = Kind.find_or_create_by(name: '#{args.kind}')\n"

      badge_string = badge_string + "badge = Badge.where 'name = ? AND kind_id = ?', '#{args.name}', kind.id

                    if badge.empty?
                      badge = Badge.create({
                        name: '#{args.name}',
                        points: '#{args.points}',
                        kind_id: kind.id,
                        default: '#{arg_default}'
                      })
                    else
                      raise 'There is another badge with this name related with this kind'
                    end
"

      if arg_default
        badge_string = badge_string + "resources = User.all\n"
        badge_string = badge_string + "resources.each do |r|
        r.points  << Point.create({ :kind_id => kind.id, :value => '#{args.points}'})
          r.badges << badge
          r.save!
        end
"
      end

      badge_string = badge_string + "puts '> Badge successfully created'"

      eval badge_string

      file_path = "/db/gioco/create_badge_#{args.name}_#{args.kind}.rb"
      File.open("#{Rails.root}#{file_path}", "w") { |f| f.write badge_string }
      File.open("#{Rails.root}/db/gioco/db.rb", "a") do |f|
        f.write "require \"\#\{Rails.root\}#{file_path}\"
"
      end

    end
  end

  desc "Used to remove an old badge at Gioco scheme"

  task :remove_badge, %i[name kind] => :environment do |_t, args|
    if !args.name || !args.kind
      raise "There are missing some arguments"
    else
      badge_string = "kind = Kind.find_by_name('#{args.kind}')
      badge = Badge.where( :name => '#{args.name}', :kind_id => kind.id ).first
      badge.destroy
"
    end

    badge_string = badge_string + "puts '> Badge successfully removed'"

    eval badge_string

    file_path = "/db/gioco/remove_badge_#{args.name}.rb"
    File.open("#{Rails.root}#{file_path}", "w") { |f| f.write badge_string }
    File.open("#{Rails.root}/db/gioco/db.rb", "a") do |f|
      f.write "require \"\#\{Rails.root\}#{file_path}\"
"
    end
  end

  desc "Removes a given kind"
  task :remove_kind, [:name] => :environment do |_t, args|
    if !args.name
      raise "There are missing some arguments"
    else
      kind_string = "kind = Kind.find_by_name( '#{args.name}' )\n"
      kind_string = kind_string + "if kind.badges.empty?
        kind.destroy
      else
        raise 'Aborted! There are badges related with this kind.'
      end\n"
    end
    kind_string = kind_string + "puts '> Kind successfully removed'"
    eval kind_string

    file_path = "/db/gioco/remove_kind_#{args.name}.rb"
    File.open("#{Rails.root}#{file_path}", "w") { |f| f.write kind_string }
    File.open("#{Rails.root}/db/gioco/db.rb", "a") { |f| f.write "require \"\#\{Rails.root\}#{file_path}\"\n" }
  end

  task sync_database: :environment do
    content = File.read("/usr/src/app/db/gioco/db.rb")
    eval content
  end
end
