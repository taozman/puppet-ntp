class ntp::config (
   String $config_file_name,
   String $config_file_mode,
   Array[String] $servers,
) {
   file { "/etc/${config_file_name}":
      ensure => file,
      owner  => 0,
      group  => 0,
      mode   => $config_file_mode,
      content => template("$module_name/ntp.conf.erb"),
   }
}
