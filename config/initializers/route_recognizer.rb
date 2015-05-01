class RouteRecognizer
  attr_reader :paths

  # To use this inside your app, call:
  # `RouteRecognizer.new.initial_path_segments`
  # This returns an array, e.g.: ['assets','blog','team','faq','users']

  INITIAL_SEGMENT_REGEX = %r{^\/([^\/\(:]+)}
  DOC_REGEX = %r{^\/docs\/.*}

  def initialize
    routes = Rails.application.routes.routes
    @paths = routes.collect {|r| r.path.spec.to_s }
  end

  def initial_path_segments
    @initial_path_segments ||= begin
      paths.collect {|path| match_initial_path_segment(path)}.compact.uniq
    end
  end

  def match_initial_path_segment(path)
    if match = INITIAL_SEGMENT_REGEX.match(path)
      match[1]
    end
  end

  def docs_paths
    @doc_paths ||= begin
      paths.collect {|path| match_doc_paths(path)}.compact.uniq
    end
  end

  def match_doc_paths(path)
    if match = DOC_REGEX.match(path)
      match[1]
    end
  end
end
