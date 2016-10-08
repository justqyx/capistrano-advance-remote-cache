require 'capistrano/recipes/deploy/strategy/remote'

module Capistrano
  module Deploy
    module Strategy

      class AdvanceRemoteCache < Remote

        def deploy!
          update_repository_cache
          copy_repository_cache
        end

        def check!
          super.check do |d|
            d.remote.writable(shared_path)
          end
        end

        private

        def repository_cache
          File.join(shared_path, configuration[:repository_cache] || "cached-copy")
        end

        def update_repository_cache
          logger.trace "updating the cached checkout on all servers"
          command = "if [ -d #{repository_cache} ]; then " +
            "#{source.sync(revision, repository_cache)}; " +
            "else #{source.checkout(revision, repository_cache)}; fi"
          scm_run(command)
        end

        def copy_repository_cache
          logger.trace "copying the cached version to #{configuration[:release_path]}"
          run "git archive #{revision} #{repository_cache} | tar -x -f - -C #{configuration[:release_path]} && #{mark}"
        end

      end

    end
  end
end
