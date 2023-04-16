###
# Do not use this file to override the mod_php5_apache2 cookbook's default
# attributes.  Instead, please use the customize.rb attributes file,
# which will keep your adjustments separate from the AWS OpsWorks
# codebase and make it easier to upgrade.
#
# However, you should not edit customize.rb directly. Instead, create
# "mod_php5_apache2/attributes/customize.rb" in your cookbook repository and
# put the overrides in YOUR customize.rb file.
#
# Do NOT create an 'mod_php5_apache2/attributes/default.rb' in your cookbooks. Doing so
# would completely override this file and might cause upgrade issues.
#
# See also: http://docs.aws.amazon.com/opsworks/latest/userguide/customizing.html
###

packages = []

case node[:platform_family]
when 'debian'
  packages = [
    "php-xsl",
    "php-curl",
    "php-xmlrpc",
    "php-sqlite",
    "php-dev",
    "php-gd",
    "php-cli",
    "php-sasl",
    "php-mcrypt",
    "php-memcache",
    "php-pear",
    "php-xml-parser",
    "php-mail-mime",
    "php-db",
    "php-mdb2",
    "php-html-common"
  ]
when 'rhel'
  packages = [
    "php-xml",
    "php-common",
    "php-xmlrpc",
    "php-gd",
    "php-cli",
    "php-pear-Auth-SASL",
    "php-mcrypt",
    "php-pecl-memcache",
    "php-pear",
    "php-pear-XML-Parser",
    "php-pear-DB",
    "php-pear-HTML-Common",
    "php",
    "php-devel",
    "php-pear-Mail-Mime"
  ]
end

default[:mod_php5_apache2][:packages] = packages

include_attribute "mod_php5_apache2::customize"
