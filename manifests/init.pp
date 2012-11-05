# This class is used to install and configure the Apache Ant tool.
#
# ==Parameters
#
# [version]  The Ant version to install.
class ant($version = $ant::params::version) inherits ant::params {

  wget::fetch { "ant":
    source => "http://archive.apache.org/dist/ant/binaries/apache-ant-${version}-bin.tar.gz",
    destination => "${srcdir}/apache-ant-${version}-bin.tar.gz"
  } ->
  exec { "tar zxvf ${srcdir}/apache-ant-${version}-bin.tar.gz":
    cwd => "/usr/share/",
    creates => "/usr/share/apache-ant-${version}",
    path    => "/bin/:/usr/bin"
  } ->
  file { "/usr/bin/ant":
    ensure => "/usr/share/apache-ant-${version}/bin/ant",
  }

}