Capistrano::DSL.stages.each do |stage|
  after stage, "check:push"
end

namespace :check do
  task :push do
    next if fetch(:skip_push_check)

    local_branch = `git symbolic-ref --short HEAD`.strip
    track = ` git branch --list --format '%(upstream:track)' #{local_branch}`.strip

    unless track == ""
      case
      when track =~ /\[ahead (\d+)\]/
        n = $~.captures.first.to_i
        warn("=" * 100)
        warn("!!! Local branch `#{local_branch}` is ahead of upstream by #{n} commit(s). Please run `git push`. !!!")
        warn("=" * 100)
        exit 1
      when track =~ /\[behind (\d+)\]/
        n = $~.captures.first.to_i
        warn("=" * 100)
        warn("!!! Local branch `#{local_branch}` is behind of upstream by #{n} commit(s). Please run `git pull`. !!!")
        warn("=" * 100)
        exit 1
      end
    end
  end
end
