use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use Test;

my $pna = Parse::NetApp::ASUP->new();
my $asup = read_file('examples/7.0.3/asup01.txt');

my $ret = $pna->load($asup);
$ret == 1 ? ok(1) : ok(0);

my $ver = $pna->asup_version($asup);
$ver eq '7.0.3' ? ok(1) : ok(0);

$ret = $pna->extract_acp_list_all();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_aggr_status();
length($ret) eq '947' ? ok(1) : ok(0);
md5_hex($ret) eq '854ec0966d6eed3080ace1119131f995' ? ok(1) : ok(0);
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
length($ret) eq '2743' ? ok(1) : ok(0);
md5_hex($ret) eq '2bb6ea28de5e1be7e05198bcb07fef26' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== CLUSTER MONITO' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df();
length($ret) eq '1099' ? ok(1) : ok(0);
md5_hex($ret) eq '6e94e9a6bcf18cf2ffe92635d62a7a6c' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF =====
Files' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_a();
length($ret) eq '210' ? ok(1) : ok(0);
md5_hex($ret) eq '0fe6509d674d9e2b649d1b6509d7e2cf' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-A =====
Agg' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_i();
length($ret) eq '482' ? ok(1) : ok(0);
md5_hex($ret) eq '969e5b643db36faa0f088f95191f39e1' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-I =====
Fil' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_r();
length($ret) eq '1123' ? ok(1) : ok(0);
md5_hex($ret) eq '9b1f4d96f43f79f9984f9644dda477df' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-R =====
Fil' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_s();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_dns_info();
length($ret) eq '608' ? ok(1) : ok(0);
md5_hex($ret) eq '60a73d9b78e91e55006145f912a50503' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DNS info =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ecc_memory_scrubber_stats();
length($ret) eq '409' ? ok(1) : ok(0);
md5_hex($ret) eq '690def71e3b0e573256f1c1490b6421e' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== ECC MEMORY SCR' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_environment();
length($ret) eq '4204' ? ok(1) : ok(0);
md5_hex($ret) eq '6495b6fdeaf446a72187ebf3467dc0d2' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== ENVIRONMENT ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_exports();
length($ret) eq '650' ? ok(1) : ok(0);
md5_hex($ret) eq '340f9cd82ece422ac03e3e0dd2820777' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== EXPORTS =====
' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_failed_disk_registry();
length($ret) eq '251' ? ok(1) : ok(0);
md5_hex($ret) eq '919320345f38b319db868d68499dd371' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FAILED_DISK_RE' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_device_map();
length($ret) eq '706' ? ok(1) : ok(0);
md5_hex($ret) eq '5773c7e9ee70c54a97042c509ed1e02b' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC DEVICE MAP ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_link_stats();
length($ret) eq '3459' ? ok(1) : ok(0);
md5_hex($ret) eq 'eb56835748c829fc866ae8776e531521' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC LINK STATS ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_stats();
length($ret) eq '21866' ? ok(1) : ok(0);
md5_hex($ret) eq '7c418669c336d6e6bb844a2060cfd6b6' ? ok(1) : ok(0);
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
length($ret) eq '1533' ? ok(1) : ok(0);
md5_hex($ret) eq '9a67debc8b23bb73cd4796c332861c98' ? ok(1) : ok(0);
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
length($ret) eq '300' ? ok(1) : ok(0);
md5_hex($ret) eq 'b8c3265bc8640e4631ebe03f3525483f' ? ok(1) : ok(0);
substr($ret,0,20) eq 'GENERATED_ON=Sun Mar' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hosts();
length($ret) eq '416' ? ok(1) : ok(0);
md5_hex($ret) eq '6684b6272a64e8118c944fd941f5ef34' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== HOSTS =====
#A' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_httpstat();
length($ret) eq '155' ? ok(1) : ok(0);
md5_hex($ret) eq '6e0fe0a8c1d91dbca8139ae14491fc1a' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== HTTPSTAT =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hwassist_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifconfig_a();
length($ret) eq '1225' ? ok(1) : ok(0);
md5_hex($ret) eq 'c1b9f8b3570852d601d8559105ddcc44' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== IFCONFIG-A ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifgrp_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifstat_a();
length($ret) eq '8762' ? ok(1) : ok(0);
md5_hex($ret) eq '8cb614a808d0bb66379b6fd9e196da72' ? ok(1) : ok(0);
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
length($ret) eq '818' ? ok(1) : ok(0);
md5_hex($ret) eq '72b202d67594d6a96602d4082d9fddb7' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== INTERCONNECT S' ? ok(1) : nok(0);
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
length($ret) eq '104' ? ok(1) : ok(0);
md5_hex($ret) eq '3d77c4ae4c47c5994a4c1f68ae3af16f' ? ok(1) : ok(0);
substr($ret,0,20) eq '	slot 2: FC Host Ada' ? ok(1) : nok(0);
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
length($ret) eq '35003' ? ok(1) : ok(0);
md5_hex($ret) eq 'ee01589fcf9d267fba0a890ed70f6a14' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== MESSAGES =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nbtstat_c();
length($ret) eq '23' ? ok(1) : ok(0);
md5_hex($ret) eq '64c65641e084ed16d6b9ea7dba5b6217' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NBTSTAT-C ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_netstat_s();
length($ret) eq '4114' ? ok(1) : ok(0);
md5_hex($ret) eq '449e1994b4460edb43226117b64acfcd' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NETSTAT-S ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_cc();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_d();
length($ret) eq '5863' ? ok(1) : ok(0);
md5_hex($ret) eq 'e76218026683fbb2b4d3d5bd09e976b7' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NFSSTAT-D ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nis_info();
length($ret) eq '410' ? ok(1) : ok(0);
md5_hex($ret) eq '5621ea55a69473d7cb76ab1c48f6c847' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NIS info =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nsswitch_conf();
length($ret) eq '229' ? ok(1) : ok(0);
md5_hex($ret) eq '935d88850a1df1ce3b1c619f12f1d897' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NSSWITCH-CONF ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_options();
length($ret) eq '16874' ? ok(1) : ok(0);
md5_hex($ret) eq 'b0c6cbeff7559579cf69129edbde639e' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== OPTIONS =====
' ? ok(1) : nok(0);
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
length($ret) eq '757' ? ok(1) : ok(0);
md5_hex($ret) eq 'e066663921b6881bdf30787032448a24' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== QTREE-STATUS =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_quotas();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_rc();
length($ret) eq '429' ? ok(1) : ok(0);
md5_hex($ret) eq '129bc1eb8d1aeedc2b30f9695671aa56' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== RC =====
#Rege' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_resolv_conf();
length($ret) eq '149' ? ok(1) : ok(0);
md5_hex($ret) eq 'a120ae49b448833a603506ae3a60ea12' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== RESOLV-CONF ==' ? ok(1) : nok(0);
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
length($ret) eq '575' ? ok(1) : ok(0);
md5_hex($ret) eq 'ed45c9a1b49e67bd55cbd069f51f5478' ? ok(1) : ok(0);
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
length($ret) eq '749' ? ok(1) : ok(0);
md5_hex($ret) eq '042fe7647332e2be886e118f8bbcd385' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-LIST-N ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_list_n_a();
length($ret) eq '75' ? ok(1) : ok(0);
md5_hex($ret) eq '6bc8ebbd4560de16e5de879286272d3a' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-LIST-N-A ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve();
length($ret) eq '405' ? ok(1) : ok(0);
md5_hex($ret) eq '585e88f3944ee16eea20bfadbab4d52d' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-RESERVE =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve_a();
length($ret) eq '90' ? ok(1) : ok(0);
md5_hex($ret) eq '521022588a7fdfb40a90a803599c75f1' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-RESERVE-A' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_sched();
length($ret) eq '240' ? ok(1) : ok(0);
md5_hex($ret) eq '8d3776f10105590eae75bdc30ec679da' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-SCHED ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_sched_a();
length($ret) eq '57' ? ok(1) : ok(0);
md5_hex($ret) eq '9fe76ccd0da46f6ae5037343440ef168' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-SCHED-A =' ? ok(1) : nok(0);
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
length($ret) eq '83' ? ok(1) : ok(0);
md5_hex($ret) eq '5944c21cebf9182b788260bc9153137c' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAPMIRROR DES' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snapmirror_status();
length($ret) eq '50' ? ok(1) : ok(0);
md5_hex($ret) eq 'cf37e9fd748aca37fbbcec15ff926eef' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAPMIRROR STA' ? ok(1) : nok(0);
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
length($ret) eq '1219' ? ok(1) : ok(0);
md5_hex($ret) eq '6536812ed362cbc100fc11b5f88455d5' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SOFTWARE LICEN' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ssh();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_storage();
length($ret) eq '23944' ? ok(1) : ok(0);
md5_hex($ret) eq 'b538cf880a08e96aea75369504e366cc' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== STORAGE =====
' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_a();
length($ret) eq '8625' ? ok(1) : ok(0);
md5_hex($ret) eq '97d1b18c1a9fffaf1f04d8317e49272f' ? ok(1) : ok(0);
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
length($ret) eq '1563' ? ok(1) : ok(0);
md5_hex($ret) eq 'f349247d0e155ba86583d9770dccd884' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-D ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_hardware_ids();
length($ret) eq '120' ? ok(1) : ok(0);
md5_hex($ret) eq '51c29c6776d297d1c67e0646225ea152' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG HARD' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_m();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_r();
length($ret) eq '3249' ? ok(1) : ok(0);
md5_hex($ret) eq '5f3099745d27cdf3a535d6469431a0b2' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-R ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_system_serial_number();
length($ret) eq '65' ? ok(1) : ok(0);
md5_hex($ret) eq '4dd1909ba23c74b25f8ecf201554fbf7' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSTEM SERIAL ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_unowned_disks();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_usage();
length($ret) eq '1509' ? ok(1) : ok(0);
md5_hex($ret) eq '604c7ee9f6a24dcdcd953df27609609d' ? ok(1) : ok(0);
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
length($ret) eq '887' ? ok(1) : ok(0);
md5_hex($ret) eq '3a40a5e769fc92b6a7474fe2864c69b2' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VIF-STATUS ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vlan_stat();
length($ret) eq '113' ? ok(1) : ok(0);
md5_hex($ret) eq '5eaddbb89b9b8ba3cf38cfe6ca70aa1f' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VLAN STAT ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_language();
length($ret) eq '269' ? ok(1) : ok(0);
md5_hex($ret) eq 'efa4ac45c2bd0fa1bc9dbc480a618946' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VOL-LANGUAGE =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_status();
length($ret) eq '6088' ? ok(1) : ok(0);
md5_hex($ret) eq '7063ae25bc447538b27a8b8c5ad95b74' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VOL-STATUS ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan();
length($ret) eq '274' ? ok(1) : ok(0);
md5_hex($ret) eq '818f8a21bd2fe1d2858a015a5e490013' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VSCAN =====

V' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan_options();
length($ret) eq '122' ? ok(1) : ok(0);
md5_hex($ret) eq '8e69a2838773a25cf9a0cbc50a65c2fa' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VSCAN OPTIONS ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vscan_scanners();
length($ret) eq '60' ? ok(1) : ok(0);
md5_hex($ret) eq '9794c533b37cc0ee4fbce706067161ab' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VSCAN SCANNERS' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_xheader();
length($ret) eq '609' ? ok(1) : ok(0);
md5_hex($ret) eq '03a70c60e894d616338987c43473de62' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== X-HEADER DATA ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

BEGIN { plan tests => 377 };
