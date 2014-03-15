Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = 'Lita'


  ### SLACK
  config.robot.name = 'Damnbot'
  config.robot.mention_name = '@damnbot'
  config.robot.alias = '/'
  # lita-slack adapter config
  #config.adapter.incoming_url = 'https://bbrmobile.slack.com/services/hooks/incoming-webhook'
  #config.adapter.username = 'damnbot'
  #config.adapter.add_mention = false
  #config.adapter.incoming_token = 'jH0ZZePpgy2XTJv03tJSSMJ2'
  #config.adapter.team_domain = 'bbrmobile'
  #config.adapter.username = 'damnbot'

  # The locale code for the language to use.
  config.robot.locale = :es

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :console # :shell, :console, :slack

  #config.http.port = 111111


  ## Example: Set options for the Redis connection.
  config.redis.host = '127.0.0.1'
  config.redis.port = 6379

  config.handlers.github_commits.repos = {
    "username/repo1" => "#someroom",
    "username/repo2" => ["#someroom", "#someotherroom"]
  }

  config.handlers.google_images.safe_search = :off

  config.handlers.jenkins.url  = "http://test.com"
  config.handlers.jenkins.auth = "user1:sekret"

  config.handlers.memegen.command_only = false
  config.handlers.memegen.username = 'bbr@yopmail.com'
  config.handlers.memegen.password = 'bbr'

end
