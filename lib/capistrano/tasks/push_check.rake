Capistrano::DSL.stages.each do |stage|
  after stage, "check:push"
end

namespace :check do
  task :push do
    next if fetch(:skip_push_check)

    local_branch = `git symbolic-ref --short HEAD`.strip
    track = ` git branch --list --format '%(upstream:track)' #{local_branch}`.strip

    unless track == ""
      track =~ /\[ahead (\d+)\]/
      n = $~.captures.first.to_i
      warn("=" * 80)
      warn("!!! Local branch `#{local_branch}` is ahead of upstream by #{n} commit(s). !!!")
      warn("=" * 80)
      exit 1
    end
  end
end
