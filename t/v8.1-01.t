use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use Test;

my $pna = Parse::NetApp::ASUP->new();
my $asup = read_file('examples/8.1/asup01.txt');

my $ret = $pna->load($asup);
$ret == 1 ? ok(1) : ok(0);

my $ver = $pna->asup_version($asup);
$ver eq '8.1' ? ok(1) : ok(0);

$ret = $pna->extract_acp_list_all();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_aggr_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
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
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_a();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_i();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_r();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_s();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_dns_info();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ecc_memory_scrubber_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_environment();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_exports();
length($ret) eq '1996' ? ok(1) : ok(0);
md5_hex($ret) eq '0299d5039fea25fbd35cb1d0b322048f' ? ok(1) : ok(0);
substr($ret,0,20) eq '/vol/images2_2010	-s' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_failed_disk_registry();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_device_map();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_link_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
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
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fmm_data();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fpolicy();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_headers();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hosts();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_httpstat();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hwassist_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifconfig_a();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifgrp_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifstat_a();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
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
length($ret) eq '2' ? ok(1) : ok(0);
md5_hex($ret) eq 'e1c06d85ae7b8b032bef47e42e4c08f9' ? ok(1) : ok(0);
substr($ret,0,20) eq '

' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nbtstat_c();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_netstat_s();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_cc();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_d();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nis_info();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nsswitch_conf();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_options();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_portsets();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_priority_show();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_qtree_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
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
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_dev_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_expander_map();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_expander_phy_state();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sas_shelf();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_service_usage();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
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
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_list_n_a();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve_a();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_sched();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_sched_a();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_status_a();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
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
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ssh();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_storage();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_a();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_ac();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_c();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_d();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_hardware_ids();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_m();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_r();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_system_serial_number();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_unowned_disks();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_usage();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
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
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vlan_stat();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_language();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan_options();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan_scanners();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_xheader();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

BEGIN { plan tests => 377 };
