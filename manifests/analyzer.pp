# class skydive::analyzer
class skydive::analyzer (
  $service                    = 'running',
  $listen                     = $::skydive::params::analyzer_listen,
  $x509_cert                  = '',
  $x509_key                   = '',
  $flowtable_expire           = $::skydive::params::analyzer_flowtable_expire,
  $flowtable_update           = $::skydive::params::analyzer_flowtable_update,
  $storage                    = $::skydive::params::analyzer_storage,
  $topology                   = $::skydive::params::analyzer_topology,
  $bandwidth_update_rate      = $::skydive::params::analyzer_bandwidth_update_rate,
  $bandwidth_source           = $::skydive::params::analyzer_bandwidth_source,
  $bandwidth_threshold        = $::skydive::params::analyzer_bandwidth_threshold,
  $bandwidth_absolute_active  = $::skydive::params::analyzer_bandwidth_absolute_active,
  $bandwidth_absolute_warning = $::skydive::params::analyzer_bandwidth_absolute_warning,
  $bandwidth_absolute_alert   = $::skydive::params::analyzer_bandwidth_absolute_alert,
  $bandwidth_relative_active  = $::skydive::params::analyzer_bandwidth_relative_active,
  $bandwidth_relative_warning = $::skydive::params::analyzer_bandwidth_relative_warning,
  $bandwidth_relative_alert   = $::skydive::params::analyzer_bandwidth_relative_alert,
  $extra_config               = {},
) inherits ::skydive {

  contain ::skydive::config::analyzer
  contain ::skydive::service::analyzer

}
