# DNSMasq Puppet Module
class dnsmasq (
  Array[String]            $interfaces          = ['p6p1'],
  Array[String]            $no_dhcp_interfaces  = ['lo', 'ham0', 'p6p1', 'p6p2'],
  Optional[String]         $local_domain        = 'pluke.int',
  Optional[String]         $domain              = 'pluke.int',
  Boolean                  $dbus_enabled        = true,
  Boolean                  $no_poll             = false,
  Boolean                  $local_service       = false,
  Boolean                  $all_servers         = true,
  Boolean                  $bogus_priv          = true,
  Boolean                  $domain_needed       = true,
  Boolean                  $localise_queries    = true,
  Boolean                  $expand_hosts        = true,
  Boolean                  $read_ethers         = true,
  Boolean                  $no_negcache         = false,
  Boolean                  $no_resolv           = false,
  Boolean                  $stop_dns_rebind     = true,
  Boolean                  $rebind_localhost_ok = true,
  Boolean                  $clear_on_reload     = false,
  Boolean                  $dhcp_authoritative  = false,
  Optional[Integer]        $neg_ttl             = undef,
  Optional[Integer]        $dns_forward_max     = undef,
  Optional[Integer]        $cache_size          = undef,
  Optional[Integer]        $log_async           = undef,
  String                   $resolv_file         = '/etc/resolv.dnsmasq.conf',
  Optional[Array[String,2] $auth_server         = undef,
  Optional[Array[String,2] $auth_zone           = ['pluke.int', '192.168.86.0/24'],
  Optional[Array[String,2] $dhcp_range          = undef,
  Optional[String]         $dhcp_dns_server     = undef,
  Optional[String]         $dhcp_log_server     = undef,
  Optional[String]         $dhcp_ntp_server     = undef,
  Optional[Integer]        $dhcp_lease_max      = undef,
  Optional[Array[String]]  $search_domains      = ['pluke.int', 'pluke.me'],
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
