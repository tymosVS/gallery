server '18.189.16.158', user: 'deploy', roles: %w{web app db}

role :app, %w{deploy@18.189.16.158}
role :web, %w{deploy@18.189.16.158}
role :db,  %w{deploy@18.189.16.158}

set :ssh_options, {
  forward_agent: true,
  keys: %w(~/.ssh/id_rsa),
  auth_methods: %w(publickey),
  user: 'deploy'
}