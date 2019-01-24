<?php
$parameters = array(
	'db_driver' => 'pdo_mysql',
	'install_source' => 'Docker',
	'db_host' => 'MAUTIC_DB_HOST',
	'db_name' => 'MAUTIC_DB_NAME',
	'db_user' => 'MAUTIC_DB_USER',
	'db_password' => 'MAUTIC_DB_PWD',
	'trusted_proxies' => array(
		"0" => "0.0.0.0/0"
	),
	'db_table_prefix' => null,
	'db_port' => '3306',
	'db_backup_tables' => 1,
	'db_backup_prefix' => 'bak_',
	'db_server_version' => '5.7.21-21',
	'mailer_from_name' => 'Powertic Marketing',
	'mailer_from_email' => 'suporte@powertic.com.br',
	'mailer_transport' => 'mail',
	'mailer_host' => "gmail.com",
	'mailer_port' => 25,
	'mailer_user' => "user",
	'mailer_password' => "pass",
	'mailer_encryption' => null,
	'mailer_auth_mode' => null,
	'mailer_spool_type' => 'memory',
	'mailer_spool_path' => '%kernel.root_dir%/spool',
	'secret_key' => 'a4a74f11f9161efe67774a1e3d7810c17ce1ebcacc16f1f0efd5fa1d3b7302d2',
	'site_url' => 'VIRTUAL_HOST',
	'api_enabled' => 0,
	'api_enable_basic_auth' => false,
	'api_oauth2_access_token_lifetime' => 60,
	'api_oauth2_refresh_token_lifetime' => 14,
	'api_batch_max_limit' => '200',
	'cors_restrict_domains' => 0,
	'cors_valid_domains' => array(

	),
	
	'anonymize_ip' => ANONIMIZE_IP,
	'track_contact_by_ip' => TRACK_BY_IP,
	'track_by_tracking_url' => TRACK_BY_URL,
	'track_by_fingerprint' => TRACK_BY_FINGERPRINT,

	'default_pagelimit' => 30,
	'default_timezone' => 'America/Sao_Paulo',
	'date_format_full' => 'F j, Y g:i a T',
	'date_format_short' => 'D, M d',
	'date_format_dateonly' => 'F j, Y',
	'date_format_timeonly' => 'g:i a',
	'ip_lookup_service' => 'maxmind_download',
	'ip_lookup_auth' => null,
	'parallel_import_limit' => '2',
);
