server '3.15.8.46', user: 'deploy', roles: %w{web app db}

role :app, %w{deploy@3.15.8.46}
role :web, %w{deploy@3.15.8.46}
role :db,  %w{deploy@3.15.8.46}

set :ssh_options, {
  forward_agent: true,
  keys: %w(~/.ssh/id_rsa),
  auth_methods: %w(publickey),
  user: 'deploy'
}