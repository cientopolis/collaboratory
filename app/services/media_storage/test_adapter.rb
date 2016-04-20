module MediaStorage
  class TestAdapter < AbstractAdapter
    def stored_path(content_type, medium_type, *path_prefix)
      extension = MIME::Types[content_type].first.extensions.first
      path = "#{medium_type}/"
      path += "#{path_prefix.join('/')}/" unless path_prefix.empty?
      path += "#{SecureRandom.uuid}.#{extension}"
      path
    end

    def put_file(path, file_path, opts={})
      true
    end

    def get_path(path, opts={})
      "https://#{path}"
    end

    def put_path(path, opts={})
      "https://#{path}"
    end
  end
end
