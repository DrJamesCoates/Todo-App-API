class ApiVersion

  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  # check whether version is defualt or specified as another version
  def matches?(request)
    check_headers(request.headers) || default
  end

  private
    
    def check_headers(headers)
      # check version from Accept headers
      # except custom media type 'todos'
      accept = headers[:accept]
      accept && accept.include?("application/vnd.todos.#{version}+json")
    end
end