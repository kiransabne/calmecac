group :god_is_watching, halt_on_fail: true do
  guard :rspec, cmd: 'bundle exec rspec -f html -o ./tmp/spec_results.html' do
    watch('spec/spec_helper.rb')                        { 'spec' }
    watch('config/routes.rb')                           { 'spec/routing' }
    watch('app/controllers/application_controller.rb')  { 'spec/controllers' }
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^app/(.+)\.rb$}) do |m|
      "spec/#{m[1]}_spec.rb"
    end
    watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$}) do |m|
      "spec/#{m[1]}#{m[2]}_spec.rb"
    end
    watch(%r{^lib/(.+)\.rb$}) do |m|
      "spec/lib/#{m[1]}_spec.rb"
    end
    watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
      [
        "spec/routing/#{m[1]}_routing_spec.rb",
        "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
        "spec/acceptance/#{m[1]}_spec.rb"
      ]
    end
  end

  guard 'puma', port: 3000, control_url: 'tcp://0.0.0.0:6969' do
    watch('Gemfile.lock')
    watch(%r{^config|lib/.*})
  end

  guard :reek do
    watch('.reek')
    watch(/^lib\/.*\.rb$/)
  end

  guard :bundler do
    watch('Gemfile')
    watch(/^.+\.gemspec$/)
  end

  guard :rubocop do
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end

  guard :brakeman, run_on_start: true do
    watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
    watch(%r{^config/.+\.rb$})
    watch(%r{^lib/.+\.rb$})
    watch('Gemfile')
  end

  guard 'bundler_audit', run_on_start: true do
    watch('Gemfile.lock')
  end
end
