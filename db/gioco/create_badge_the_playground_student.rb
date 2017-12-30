kind = Kind.find_or_create_by(name: 'student')
badge = Badge.where 'name = ? AND kind_id = ?', 'the_playground', kind.id

                    if badge.empty?
                      badge = Badge.create({
                        name: 'the_playground',
                        points: '1',
                        kind_id: kind.id,
                        default: 'false'
                      })
                    else
                      raise 'There is another badge with this name related with this kind'
                    end
puts '> Badge successfully created'