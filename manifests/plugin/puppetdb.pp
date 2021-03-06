# = PuppetDB Foreman plugin
#
# Installs the puppetdb_foreman plugin
#
# === Parameters:
#
# $package::           Package name to install, use ruby193-rubygem-puppetdb_foreman on Foreman 1.8/1.9 on EL
#
# $address::           Address of puppetdb API.
#                      Defaults to 'https://localhost:8081/pdb/cmd/v1'
#
# $dashboard_address:: Address of puppetdb dashboard.
#                      Defaults to 'http://localhost:8080/pdb/dashboard'
#
# $ssl_ca_file::       CA certificate file which will be used to connect to the PuppetDB API.
#                      Defaults to client_ssl_ca
#
# $ssl_certificate::   Certificate file which will be used to connect to the PuppetDB API.
#                      Defaults to client_ssl_cert
#
# $ssl_private_key::   Private key file which will be used to connect to the PuppetDB API.
#                      Defaults to client_ssl_key
class foreman::plugin::puppetdb (
  String $package = $::foreman::plugin::puppetdb::params::package,
  Stdlib::HTTPUrl $address = $::foreman::plugin::puppetdb::params::address,
  Stdlib::HTTPUrl $dashboard_address = $::foreman::plugin::puppetdb::params::dashboard_address,
  String $ssl_ca_file = $::foreman::plugin::puppetdb::params::ssl_ca_file,
  String $ssl_certificate = $::foreman::plugin::puppetdb::params::ssl_certificate,
  String $ssl_private_key = $::foreman::plugin::puppetdb::params::ssl_private_key,
) inherits foreman::plugin::puppetdb::params {
  foreman::plugin { 'puppetdb':
    package => $package,
  }
  -> foreman_config_entry { 'puppetdb_enabled':
    value => true,
  }
  -> foreman_config_entry { 'puppetdb_address':
    value => $address,
  }
  -> foreman_config_entry { 'puppetdb_dashboard_address':
    value => $dashboard_address,
  }
  -> foreman_config_entry { 'puppetdb_ssl_ca_file':
    value => $ssl_ca_file,
  }
  -> foreman_config_entry { 'puppetdb_ssl_certificate':
    value => $ssl_certificate,
  }
  -> foreman_config_entry { 'puppetdb_ssl_private_key':
    value => $ssl_private_key,
  }
}
