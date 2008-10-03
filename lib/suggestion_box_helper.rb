module SuggestionBoxHelper
  def suggestion_box(application_name)
    config = File.open("#{RAILS_ROOT}/config/suggestion_box.yml") 
    options = YAML.load(config)
    f = File.open("#{RAILS_ROOT}/vendor/plugins/suggestion_box/lib/template.html")
    ret = ""
    f.each do |line|
      ret << line.gsub('[[application_name]]'){application_name}.gsub('[[url]]'){options[:url]}
    end
    return ret
  end
end
