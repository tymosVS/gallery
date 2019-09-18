server '18.189.16.88', user: 'deploy', password: 'deploy', roles: %w{web app db}

role :app, %w{deploy@18.189.16.88}
role :web, %w{deploy@18.189.16.88}
role :db,  %w{deploy@18.189.16.88}

set :ssh_options, {
  forward_agent: true,
  keys: %w(~/.ssh/id_rsa),
  auth_methods: %w(publickey),
  user: 'deploy'
}