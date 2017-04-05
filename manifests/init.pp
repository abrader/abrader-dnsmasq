# DNSMasq Puppet Module
class dnsmasq (
  Array[String] $interfaces         = ['p6p1'],
  Array[String] $no_dhcp_interfaces = ['lo', 'ham0', 'p6p1', 'p6p2']
){

  package { 'dnsmasq' :
    ensure => present,
  }

  file { 'dnsmasq_config_file' :
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    path    => '/tmp/dnsmasq.conf',
    content => epp('dnsmasq/dnsmasq.conf.epp'),
    require => Package['dnsmasq'],
  }

}
