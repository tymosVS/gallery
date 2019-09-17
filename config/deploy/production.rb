server '18.224.40.55', user: 'deploy', roles: %w{web app db}

role :app, %w{deploy@18.224.40.55}
role :web, %w{deploy@18.224.40.55}
role :db,  %w{deploy@18.224.40.55}

set :ssh_options, {
  forward_agent: true,
  keys: %w(~/.ssh/id_rsa),
  auth_methods: %w(publickey),
  user: 'deploy'
}