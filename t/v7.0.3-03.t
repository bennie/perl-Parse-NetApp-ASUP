use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use Test;

my $pna = Parse::NetApp::ASUP->new();
my $asup = read_file('examples/7.0.3/asup03.txt');

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
length($ret) eq '913' ? ok(1) : ok(0);
md5_hex($ret) eq '78c786c2cf197578384b9623401c08c0' ? ok(1) : ok(0);
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
length($ret) eq '2725' ? ok(1) : ok(0);
md5_hex($ret) eq '09c9d400af35509ddf8a9d3607c95658' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== CLUSTER MONITO' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df();
length($ret) eq '1011' ? ok(1) : ok(0);
md5_hex($ret) eq 'ae46341a3e29a395fa42be252b530f8d' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF =====
Files' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_a();
length($ret) eq '210' ? ok(1) : ok(0);
md5_hex($ret) eq 'f252d151e4c833c108b382f2233deaa2' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-A =====
Agg' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_i();
length($ret) eq '442' ? ok(1) : ok(0);
md5_hex($ret) eq '8d2e1f9cc1c542a4e8baef211606f155' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-I =====
Fil' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_r();
length($ret) eq '1035' ? ok(1) : ok(0);
md5_hex($ret) eq '12557f10bd2046f889fc45395961daa7' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-R =====
Fil' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_s();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_dns_info();
length($ret) eq '531' ? ok(1) : ok(0);
md5_hex($ret) eq 'ffe09ab8e55f7b422760001c5eff5fee' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DNS info =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ecc_memory_scrubber_stats();
length($ret) eq '409' ? ok(1) : ok(0);
md5_hex($ret) eq '9935aa401adcb847e6b24a0b4d46a1fa' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== ECC MEMORY SCR' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_environment();
length($ret) eq '7756' ? ok(1) : ok(0);
md5_hex($ret) eq 'b77017864b6169ff7d7507c3455bafef' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== ENVIRONMENT ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_exports();
length($ret) eq '293' ? ok(1) : ok(0);
md5_hex($ret) eq '32b23988a8885e5c69db26b78a5dae07' ? ok(1) : ok(0);
substr($ret,0,20) eq '/vol/vol_grin_cspi_d' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_failed_disk_registry();
length($ret) eq '246' ? ok(1) : ok(0);
md5_hex($ret) eq '60f66a12904a05c5c68da3a1afc80625' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FAILED_DISK_RE' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_device_map();
length($ret) eq '907' ? ok(1) : ok(0);
md5_hex($ret) eq '523ed912166dbee19d4ca1f466387b1d' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC DEVICE MAP ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_link_stats();
length($ret) eq '5303' ? ok(1) : ok(0);
md5_hex($ret) eq '6ed2840e1831b0969717326d44e53e82' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC LINK STATS ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_stats();
length($ret) eq '25880' ? ok(1) : ok(0);
md5_hex($ret) eq '3143f6d363e4dc7d9687eac4e757d762' ? ok(1) : ok(0);
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
length($ret) eq '1532' ? ok(1) : ok(0);
md5_hex($ret) eq '256c68fdcbea667e8647fe92694b93f8' ? ok(1) : ok(0);
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
length($ret) eq '301' ? ok(1) : ok(0);
md5_hex($ret) eq '72b3387e3e82a930f3281c742bc3fdcb' ? ok(1) : ok(0);
substr($ret,0,20) eq 'GENERATED_ON=Sun Jun' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hosts();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_httpstat();
length($ret) eq '155' ? ok(1) : ok(0);
md5_hex($ret) eq 'be96ec9e4efc1f29ce704ee17d149be5' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== HTTPSTAT =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hwassist_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifconfig_a();
length($ret) eq '952' ? ok(1) : ok(0);
md5_hex($ret) eq '2398171c1eb942ad9ccdf2d0ac37b92e' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== IFCONFIG-A ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifgrp_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifstat_a();
length($ret) eq '6286' ? ok(1) : ok(0);
md5_hex($ret) eq '8268b388667320f2aa81d5d6618e07cd' ? ok(1) : ok(0);
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
length($ret) eq '511' ? ok(1) : ok(0);
md5_hex($ret) eq '055bea7f9125c4806ec695ec003eac7d' ? ok(1) : ok(0);
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
length($ret) eq '208' ? ok(1) : ok(0);
md5_hex($ret) eq '16525ead8e4c7f261b982b9f59903562' ? ok(1) : ok(0);
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
length($ret) eq '2168812' ? ok(1) : ok(0);
md5_hex($ret) eq '2e86c3f695b85aad72a9fe680aeffbe1' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== MESSAGES =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nbtstat_c();
length($ret) eq '23' ? ok(1) : ok(0);
md5_hex($ret) eq '64c65641e084ed16d6b9ea7dba5b6217' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NBTSTAT-C ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_netstat_s();
length($ret) eq '3968' ? ok(1) : ok(0);
md5_hex($ret) eq '392bafc0fc36a88d5926670f22fa6c11' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NETSTAT-S ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_cc();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_d();
length($ret) eq '5854' ? ok(1) : ok(0);
md5_hex($ret) eq '56ddc559184aa911c8271118bec9ce35' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NFSSTAT-D ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nis_info();
length($ret) eq '334' ? ok(1) : ok(0);
md5_hex($ret) eq '39db7e282f1143328d27581b1ea0920b' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NIS info =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nsswitch_conf();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_options();
length($ret) eq '16834' ? ok(1) : ok(0);
md5_hex($ret) eq '2a336f8b5beddfa8dff6f1ffabb9080a' ? ok(1) : ok(0);
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
length($ret) eq '790' ? ok(1) : ok(0);
md5_hex($ret) eq '42e34517cf013627c10e52a3b0efbb63' ? ok(1) : ok(0);
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
length($ret) eq '577' ? ok(1) : ok(0);
md5_hex($ret) eq 'd904605cf69e1cd2423b4ff2d8c848b2' ? ok(1) : ok(0);
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
length($ret) eq '698' ? ok(1) : ok(0);
md5_hex($ret) eq '857d137b1d69e9b432ae767eb199d853' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-LIST-N ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_list_n_a();
length($ret) eq '247' ? ok(1) : ok(0);
md5_hex($ret) eq '31b70f03adf6ac011cd011e1e22584bd' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-LIST-N-A ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve();
length($ret) eq '396' ? ok(1) : ok(0);
md5_hex($ret) eq '8626e68f1692e3f4be0916ed544e6441' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-RESERVE =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve_a();
length($ret) eq '97' ? ok(1) : ok(0);
md5_hex($ret) eq 'ca89d76985c5c13f0ddfca1852895865' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-RESERVE-A' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_sched();
length($ret) eq '216' ? ok(1) : ok(0);
md5_hex($ret) eq '33ee585b3098d5aba96739db77f4d880' ? ok(1) : ok(0);
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
length($ret) eq '45376' ? ok(1) : ok(0);
md5_hex($ret) eq 'e625ea0b49c55e7553bfd6114f78c803' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== STORAGE =====
' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_a();
length($ret) eq '10646' ? ok(1) : ok(0);
md5_hex($ret) eq 'dede708683f523e63fe9be2b7ce34819' ? ok(1) : ok(0);
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
length($ret) eq '3253' ? ok(1) : ok(0);
md5_hex($ret) eq '911372885b79fa9f20ac901df1ef2849' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-D ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_hardware_ids();
length($ret) eq '92' ? ok(1) : ok(0);
md5_hex($ret) eq '30219e461d4ef6b0dfd6ef13abd0afe9' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG HARD' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_m();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_r();
length($ret) eq '5605' ? ok(1) : ok(0);
md5_hex($ret) eq 'd27d5618ba706b09d43940bb942ce1a4' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-R ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_system_serial_number();
length($ret) eq '65' ? ok(1) : ok(0);
md5_hex($ret) eq '37cee3b51cb1be0357b914b1077aedec' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSTEM SERIAL ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_unowned_disks();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_usage();
length($ret) eq '2534' ? ok(1) : ok(0);
md5_hex($ret) eq 'e012a8544e0fc32fa4eb7cb1da4117c4' ? ok(1) : ok(0);
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
length($ret) eq '1245' ? ok(1) : ok(0);
md5_hex($ret) eq '58fcabcda87c7597c1ee05effc2acc0c' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VIF-STATUS ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vlan_stat();
length($ret) eq '113' ? ok(1) : ok(0);
md5_hex($ret) eq '5eaddbb89b9b8ba3cf38cfe6ca70aa1f' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VLAN STAT ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_language();
length($ret) eq '257' ? ok(1) : ok(0);
md5_hex($ret) eq 'ca6a293df89575505dedc1bd8004096a' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VOL-LANGUAGE =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_status();
length($ret) eq '6064' ? ok(1) : ok(0);
md5_hex($ret) eq 'f5d21d1e01369b31a38a536f34f573a7' ? ok(1) : ok(0);
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
length($ret) eq '613' ? ok(1) : ok(0);
md5_hex($ret) eq '840e7a3222953acb51eab543db16daf7' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== X-HEADER DATA ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

BEGIN { plan tests => 377 };
