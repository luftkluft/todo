Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "javascripts")
Rails.application.config.assets.precompile += %w[application.js]
Rails.application.config.assets.precompile += %w[landing.js]
Rails.application.config.assets.precompile += %w[lists_index.js]
Rails.application.config.assets.precompile += %w[navigation.js]
Rails.application.config.assets.precompile += %w[sorting.js]