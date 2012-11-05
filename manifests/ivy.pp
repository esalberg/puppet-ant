# This class is used to install and configure the Apache Ivy dependency management tool.
#
# ==Parameters
#
# [version]  The Ivy version to install.
class ant::ivy($version="2.2.0") {
  include ant

  wget::fetch { "ivy":
    source => "http://mirrors.gigenet.com/apache//ant/ivy/${version}/apache-ivy-${version}-bin.tar.gz",
    destination => "${ant::srcdir}/apache-ivy-${version}-bin.tar.gz",
    require => Class[ant],
  } ->
  exec { "tar zxvf ${ant::srcdir}/apache-ivy-${version}-bin.tar.gz":
    cwd => "/usr/share",
    path => "/bin/:/usr/bin",
    creates => "/usr/share/apache-ivy-${version}"
  } ->
  file { "/usr/share/apache-ant-${ant::version}/lib/ivy-${version}.jar":
    ensure => "/usr/share/apache-ivy-${version}/ivy-${version}.jar",
  }
}