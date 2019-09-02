<?php 

if ($settings_xml_path = getenv('SETTINGS_XML_PATH')) {
	define('SETTINGS_XML_PATH', $settings_xml_path);
} else {
	define('SETTINGS_XML_PATH', '/storage/.kodi/userdata/addon_data/program.plexusscraper/settings.xml');
}
define('DETERMINE_ADAPTER_IP', 'FALSE');

?>
