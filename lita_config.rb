Lita.configure do |config|

  robot_config = OpenStruct.new YAML.load_file("#{File.dirname(__FILE__)}/config/robot.yml")
  config.robot.name = robot_config.name
  config.robot.mention_name = robot_config.mention_name
  config.robot.alias = robot_config.alias

  # The locale code for the language to use.
  config.robot.locale = robot_config.locale

  ### lita-slack adapter config
  # slack_config = OpenStruct.new YAML.load_file("#{File.dirname(__FILE__)}/config/slack.yml")
  # config.adapter.incoming_url = slack_config.incoming_url
  # config.adapter.username = slack_config.username
  # config.adapter.add_mention = slack_config.add_mention
  # config.adapter.incoming_token = slack_config.incoming_token
  # config.adapter.team_domain = slack_config.team_domain

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  config.robot.admins = robot_config.admins 

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :console # :shell, :console, :slack

  config.http.port = robot_config.port unless [:shell, :console].include? config.robot.adapter


  # Set options for the Redis connection.
  redis_config = OpenStruct.new YAML.load_file('config/redis.yml')
  config.redis.host = redis_config.host
  config.redis.port = redis_config.port

  config.handlers.github_commits.repos = {
    "username/repo1" => "#someroom",
    "username/repo2" => ["#someroom", "#someotherroom"]
  }

  config.handlers.google_images.safe_search = :off

  jenkins_config = OpenStruct.new YAML.load_file('config/jenkins.yml')
  config.handlers.jenkins.url  = jenkins_config.url
  config.handlers.jenkins.auth = jenkins_config.auth

  memegen_config = OpenStruct.new YAML.load_file("#{File.dirname(__FILE__)}/config/memegen.yml")
  config.handlers.memegen.command_only = memegen_config.command_only
  config.handlers.memegen.username = memegen_config.username
  config.handlers.memegen.password = memegen_config.password

end

Lita.load_locales Dir[File.expand_path(
                          File.join("..", "..", "locales", "*.yml"), __FILE__
                      )]
