module ComponentTemplate
  class Engine < ::Rails::Engine
    isolate_namespace ComponentTemplate
    
    # Initialize engine dependencies on wrapper application
    Gem.loaded_specs["component_template"].dependencies.each do |d|
      begin
        require d.name
      rescue LoadError => le
        # Put exceptions here.
        # raise le if d.name !~ /factory_girl_rails/
      end
    end
    
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
