
 server 'gtcbe-prod.cloudapp.net',
   user: 'deploy',
   roles: %w{web app db},
   ssh_options: {
     user: 'deploy', # overrides user setting above
     keys: %w(/home/azureuser/.ssh/id_rsa),
     forward_agent: true,
     auth_methods: %w(publickey password)
     # password: 'please use keys'
  }

