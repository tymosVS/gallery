server '18.217.201.16', user: 'deploy', password: 'deploy', roles: %w{web app db}

role :app, %w{deploy@18.217.201.16}
role :web, %w{deploy@18.217.201.16}
role :db,  %w{deploy@18.217.201.16}

set :ssh_options, {
  forward_agent: true,
  keys: %w(~/.ssh/id_rsa),
  auth_methods: %w(publickey),
  user: 'deploy'
}