use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use Test;

my $pna = Parse::NetApp::ASUP->new();
my $asup = read_file('examples/7.2.3/asup03.txt');

my $ret = $pna->load($asup);
$ret == 1 ? ok(1) : ok(0);

my $ver = $pna->asup_version($asup);
$ver eq '7.2.3' ? ok(1) : ok(0);

$ret = $pna->extract_acp_list_all();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_aggr_status();
length($ret) eq '4124' ? ok(1) : ok(0);
md5_hex($ret) eq '2724f009e66a2e0a373f341bfe22d991' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== AGGR-STATUS ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_cf_monitor();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_cifs_domaininfo();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_cifs_sessions();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_cifs_shares();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_cifs_stat();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_cluster_monitor();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df();
length($ret) eq '4623' ? ok(1) : ok(0);
md5_hex($ret) eq 'de1f45ba8dd411f84925ec65514a4aa0' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF =====
Files' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_a();
length($ret) eq '700' ? ok(1) : ok(0);
md5_hex($ret) eq 'c2f34f93704ddbb22a4c4da11700f9aa' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-A =====
Agg' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_i();
length($ret) eq '1861' ? ok(1) : ok(0);
md5_hex($ret) eq '84073be352563e2900f43b7be915dd9b' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-I =====
Fil' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_r();
length($ret) eq '4739' ? ok(1) : ok(0);
md5_hex($ret) eq '08dfb61c12f378a16f623f9adcaccffc' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-R =====
Fil' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_s();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_dns_info();
length($ret) eq '630' ? ok(1) : ok(0);
md5_hex($ret) eq 'b427e72bd19f3acd5579f4a1f6febf7b' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DNS info =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ecc_memory_scrubber_stats();
length($ret) eq '408' ? ok(1) : ok(0);
md5_hex($ret) eq '6cab5f79f9a7c3c9ebae7e0a17a0427b' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== ECC MEMORY SCR' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_environment();
length($ret) eq '30361' ? ok(1) : ok(0);
md5_hex($ret) eq '5629fd372eb53c752e7f953824664631' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== ENVIRONMENT ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_exports();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_failed_disk_registry();
length($ret) eq '1119' ? ok(1) : ok(0);
md5_hex($ret) eq '0dcaa5952554489365ef25de6165a449' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FAILED_DISK_RE' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_device_map();
length($ret) eq '2743' ? ok(1) : ok(0);
md5_hex($ret) eq '082247f87b91384f12274fd94ab7d4a3' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC DEVICE MAP ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_link_stats();
length($ret) eq '18252' ? ok(1) : ok(0);
md5_hex($ret) eq '1dd19b09bda335e3d28e89b438e80aac' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC LINK STATS ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_stats();
length($ret) eq '53530' ? ok(1) : ok(0);
md5_hex($ret) eq '74ee870655d552bc8428a696c11945f6' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC STATS =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fcp_cfmode();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fcp_initiator_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fcp_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fcp_target_adapters();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fcp_target_configuration();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fcp_target_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_flash_card_info();
length($ret) eq '4988' ? ok(1) : ok(0);
md5_hex($ret) eq 'fb483508835b42b84d08882728f60e71' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FLASH CARD INF' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fmm_data();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fpolicy();
length($ret) eq '72' ? ok(1) : ok(0);
md5_hex($ret) eq '277f52a138fec654178bb3bd947144e4' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FPOLICY =====
' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_headers();
length($ret) eq '183' ? ok(1) : ok(0);
md5_hex($ret) eq '480e372cbd12432817eb2a89fdfa83b5' ? ok(1) : ok(0);
substr($ret,0,20) eq 'GENERATED_ON=Thu Apr' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hosts();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_httpstat();
length($ret) eq '152' ? ok(1) : ok(0);
md5_hex($ret) eq '4aed1f93d896e5e87a5a2ea080c15a3c' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== HTTPSTAT =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hwassist_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifconfig_a();
length($ret) eq '1181' ? ok(1) : ok(0);
md5_hex($ret) eq '9e43ec51a055b77483573e4d88c74399' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== IFCONFIG-A ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifgrp_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifstat_a();
length($ret) eq '8028' ? ok(1) : ok(0);
md5_hex($ret) eq '42fd61833cf6f30f33afbef80fdecbe9' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== IFSTAT-A =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_initiator_groups();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_interconnect_config();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_interconnect_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_alias();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_connections();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_initiator_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_interface();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_interface_accesslist();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_isns();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_nodename();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_portals();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_security();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_sessions();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_statistics();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_iscsi_target_portal_groups();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_lun_config_check();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_lun_configuration();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_lun_hist();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_lun_statistics();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_messages();
length($ret) eq '71127' ? ok(1) : ok(0);
md5_hex($ret) eq 'b1ddfc25c90ea4ace506bb7c1b25d85e' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== MESSAGES =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nbtstat_c();
length($ret) eq '23' ? ok(1) : ok(0);
md5_hex($ret) eq '64c65641e084ed16d6b9ea7dba5b6217' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NBTSTAT-C ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_netstat_s();
length($ret) eq '5009' ? ok(1) : ok(0);
md5_hex($ret) eq '521ff0446c14f2611260f178ec97d695' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NETSTAT-S ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_cc();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_d();
length($ret) eq '6899' ? ok(1) : ok(0);
md5_hex($ret) eq '82a184a130ea1575d6cbe3c9296109a4' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NFSSTAT-D ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nis_info();
length($ret) eq '42' ? ok(1) : ok(0);
md5_hex($ret) eq '2db8e61e6b2275ed465c235998197c78' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NIS info =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nsswitch_conf();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_options();
length($ret) eq '12651' ? ok(1) : ok(0);
md5_hex($ret) eq '28b5962e5ccbcecd5e3ecbf600ae6fd1' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== OPTIONS =====
' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_portsets();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_priority_show();
length($ret) eq '302' ? ok(1) : ok(0);
md5_hex($ret) eq '8ab28988525d17a49f25e95f9bfdf3cb' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== PRIORITY_SHOW ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_qtree_status();
length($ret) eq '1383' ? ok(1) : ok(0);
md5_hex($ret) eq 'dc5fda1ed508cdf3c68f8b1c642436bd' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== QTREE-STATUS =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_quotas();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_rc();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_resolv_conf();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_route_gsn();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_adapter_state();
length($ret) eq '54' ? ok(1) : ok(0);
md5_hex($ret) eq 'c87ff86b39c04817aa859f701716bb07' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SAS ADAPTER ST' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_dev_stats();
length($ret) eq '50' ? ok(1) : ok(0);
md5_hex($ret) eq 'b33421490bca5adb39aa7f0689013980' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SAS DEV STATS ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_expander_map();
length($ret) eq '53' ? ok(1) : ok(0);
md5_hex($ret) eq 'c415e21c5c7d59e715bd13b6a04755b2' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SAS EXPANDER M' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_expander_phy_state();
length($ret) eq '59' ? ok(1) : ok(0);
md5_hex($ret) eq '351bf69e737c80403addfb9f92dca68f' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SAS EXPANDER P' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_shelf();
length($ret) eq '46' ? ok(1) : ok(0);
md5_hex($ret) eq '14cf236995f99ded93cc5bcb465f39d7' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SAS SHELF ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_service_usage();
length($ret) eq '571' ? ok(1) : ok(0);
md5_hex($ret) eq 'fd0fd431761fb5cc2d71b6606581736a' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SERVICE USAGE ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_shelf_log_esh();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_shelf_log_iom();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sis_stat();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sis_stat_l();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sis_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sis_status_l();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sm_allow();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sm_conf();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_list_n();
length($ret) eq '1329' ? ok(1) : ok(0);
md5_hex($ret) eq 'f9c77a73b485fb7edf16c619766c6d96' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-LIST-N ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_list_n_a();
length($ret) eq '271' ? ok(1) : ok(0);
md5_hex($ret) eq '9f9185b7059f174ddf2de54c97e86f6e' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-LIST-N-A ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve();
length($ret) eq '1695' ? ok(1) : ok(0);
md5_hex($ret) eq '730843c82fa08629f43e257c7c4daa95' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-RESERVE =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve_a();
length($ret) eq '338' ? ok(1) : ok(0);
md5_hex($ret) eq 'ca899f5235c4207dffdc2ba2a1c078df' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-RESERVE-A' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_sched();
length($ret) eq '601' ? ok(1) : ok(0);
md5_hex($ret) eq '1cebb4f3c0444870415a01e853cd2e88' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-SCHED ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_sched_a();
length($ret) eq '141' ? ok(1) : ok(0);
md5_hex($ret) eq '7c41031bfaa75d62cfc7af6a41349e0d' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-SCHED-A =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_status();
length($ret) eq '993' ? ok(1) : ok(0);
md5_hex($ret) eq 'ef469ecb4626028950421cab59b9fd23' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-STATUS ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_status_a();
length($ret) eq '211' ? ok(1) : ok(0);
md5_hex($ret) eq 'e08784121a37ada216b8bd80b6dbec9f' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-STATUS-A ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snapmirror_destinations();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snapmirror_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snapvault_destinations();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snapvault_snap_sched();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snapvault_status_l();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snaplock();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snaplock_clock();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_software_licenses();
length($ret) eq '1264' ? ok(1) : ok(0);
md5_hex($ret) eq '24907ade1354f20fcc34f0174d7eb99b' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SOFTWARE LICEN' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ssh();
length($ret) eq '109' ? ok(1) : ok(0);
md5_hex($ret) eq 'd11440fcaf83d3f35ff2817bcc2d6832' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SSH =====
SSH1' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_storage();
length($ret) eq '180894' ? ok(1) : ok(0);
md5_hex($ret) eq '1ecf17a0d8e0f1ed7b7c00f7f939d98c' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== STORAGE =====
' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_a();
length($ret) eq '27059' ? ok(1) : ok(0);
md5_hex($ret) eq 'b7a9baa50616ac83dec92fa6563fc8c2' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-A ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_ac();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_c();
length($ret) eq '71' ? ok(1) : ok(0);
md5_hex($ret) eq '130e776967aeedcb74176ab0f96778a9' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-C ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_d();
length($ret) eq '6353' ? ok(1) : ok(0);
md5_hex($ret) eq '71d155bde206cba904f9ceebb783121c' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-D ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_hardware_ids();
length($ret) eq '172' ? ok(1) : ok(0);
md5_hex($ret) eq '9caf678d006093a78d92d2821a529fd1' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG HARD' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_m();
length($ret) eq '15126' ? ok(1) : ok(0);
md5_hex($ret) eq '5e61366f6db0ac3366a66cf0ed8d77ce' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-M ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_r();
length($ret) eq '14518' ? ok(1) : ok(0);
md5_hex($ret) eq '69712ac331f098eda3480a71b6fdd8de' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-R ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_system_serial_number();
length($ret) eq '65' ? ok(1) : ok(0);
md5_hex($ret) eq 'c331b769be1d00306869eb11bde7e521' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSTEM SERIAL ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_unowned_disks();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_usage();
length($ret) eq '3757' ? ok(1) : ok(0);
md5_hex($ret) eq '786e954cf34e9298dc0f67be2a4bde92' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== USAGE =====
ap' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_usermap_cfg();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vfiler_startup_times();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vfilers();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vif_status();
length($ret) eq '2154' ? ok(1) : ok(0);
md5_hex($ret) eq '5891adf32cd5d8700fe432e27bacf7f5' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VIF-STATUS ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vlan_stat();
length($ret) eq '113' ? ok(1) : ok(0);
md5_hex($ret) eq '5eaddbb89b9b8ba3cf38cfe6ca70aa1f' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VLAN STAT ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_language();
length($ret) eq '1142' ? ok(1) : ok(0);
md5_hex($ret) eq 'ea1a654e58f1440d458201034518523c' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VOL-LANGUAGE =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_status();
length($ret) eq '41567' ? ok(1) : ok(0);
md5_hex($ret) eq '213fb3112263482a564ac142130ec1d3' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VOL-STATUS ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan();
length($ret) eq '272' ? ok(1) : ok(0);
md5_hex($ret) eq '023c920d21ae3af53cfe84ef33401bc5' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VSCAN =====

V' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan_options();
length($ret) eq '179' ? ok(1) : ok(0);
md5_hex($ret) eq '35083f8fa18e3d4543f63a9d2697d0ce' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VSCAN OPTIONS ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan_scanners();
length($ret) eq '60' ? ok(1) : ok(0);
md5_hex($ret) eq '9794c533b37cc0ee4fbce706067161ab' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VSCAN SCANNERS' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_xheader();
length($ret) eq '640' ? ok(1) : ok(0);
md5_hex($ret) eq 'a300951b889717e65d1e1a66fd2d385d' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== X-HEADER DATA ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

BEGIN { plan tests => 377 };
