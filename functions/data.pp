function ntp::data () {
   $base_params = {
      "ntp::config_file_name"   => "ntp.conf",
      "ntp::config_file_mode"   => "0664",
      "ntp::servers"            => ['0.centos.pool.ntp.org','1.centos.pool.ntp.org'],
      "ntp::package_name"       => 'ntp',
      "ntp::package_ensure"     => 'present',
      "ntp::service_ensure"     => 'running',
      "ntp::service_enable"     => true,
      "ntp::service_hasstatus"  => true,
      "ntp::service_hasrestart" => true,
   }

   $os_params = {
      "ntp::service_name" => $facts['os']['family'] ? {
         'Debian' => 'ntp',
         default  => 'ntpd',
      }
   }

   $base_params + $os_params
}
