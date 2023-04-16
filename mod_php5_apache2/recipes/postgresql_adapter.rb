package 'php-pgsql' do
  package_name value_for_platform_family(
    'rhel' => 'php-pgsql',
    'debian' => 'php-pgsql'
  )
  retries 3
  retry_delay 5
end
