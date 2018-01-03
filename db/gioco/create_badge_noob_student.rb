kind = Kind.find_or_create_by(name: 'student')
badge = Badge.where 'name = ? AND kind_id = ?', 'noob', kind.id

                    if badge.empty?
                      badge = Badge.create({
                        name: 'noob',
                        points: '0',
                        kind_id: kind.id,
                        default: 'true'
                      })
                    else
                      raise 'There is another badge with this name related with this kind'
                    end
resources = User.all
resources.each do |r|
        r.points  << Point.create({ :kind_id => kind.id, :value => '0'})
          r.badges << badge
          r.save!
        end
puts '> Badge successfully created'