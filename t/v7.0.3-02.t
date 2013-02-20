use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use Test;

my $pna = Parse::NetApp::ASUP->new();
my $asup = read_file('examples/7.0.3/asup02.txt');

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
md5_hex($ret) eq 'c5d97a2264357f30342ce7bd05896f21' ? ok(1) : ok(0);
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
length($ret) eq '2741' ? ok(1) : ok(0);
md5_hex($ret) eq 'f6f5940a1015653302cffd0b7fb8ab94' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== CLUSTER MONITO' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df();
length($ret) eq '1052' ? ok(1) : ok(0);
md5_hex($ret) eq '584329554bd34d520615b89551f8a89c' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF =====
Files' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_a();
length($ret) eq '210' ? ok(1) : ok(0);
md5_hex($ret) eq '35eaf2033a5047ba52f52f371ced2df7' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-A =====
Agg' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_i();
length($ret) eq '482' ? ok(1) : ok(0);
md5_hex($ret) eq '10bc94829cc8007cf11c3068ce4f4bd4' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-I =====
Fil' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_r();
length($ret) eq '1076' ? ok(1) : ok(0);
md5_hex($ret) eq '10938aeccc04cb7693b0baab90f8f4f4' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DF-R =====
Fil' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_df_s();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_dns_info();
length($ret) eq '605' ? ok(1) : ok(0);
md5_hex($ret) eq '920a0f9085c596441dd45e1358de9dcf' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== DNS info =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ecc_memory_scrubber_stats();
length($ret) eq '409' ? ok(1) : ok(0);
md5_hex($ret) eq '0e167e4d46a2722864188c0c3d5a242f' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== ECC MEMORY SCR' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_environment();
length($ret) eq '4201' ? ok(1) : ok(0);
md5_hex($ret) eq '31a59529f222b8334759ac0346c03cf9' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== ENVIRONMENT ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_exports();
length($ret) eq '640' ? ok(1) : ok(0);
md5_hex($ret) eq '52284b430fe3212e92fbf12875b3fc97' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== EXPORTS =====
' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_failed_disk_registry();
length($ret) eq '251' ? ok(1) : ok(0);
md5_hex($ret) eq '14c89cca29d20c5f799c4ac6ae4bd1e0' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FAILED_DISK_RE' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_device_map();
length($ret) eq '653' ? ok(1) : ok(0);
md5_hex($ret) eq '9fe1aaea5a0c6a786685435c3091e3d9' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC DEVICE MAP ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_link_stats();
length($ret) eq '3103' ? ok(1) : ok(0);
md5_hex($ret) eq '5c622fe973a036b83b878f5622a43154' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== FC LINK STATS ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_fc_stats();
length($ret) eq '21554' ? ok(1) : ok(0);
md5_hex($ret) eq 'dc352f7dc437b85b116560e954186f81' ? ok(1) : ok(0);
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
md5_hex($ret) eq 'c54304331210538714cc28002118ffa0' ? ok(1) : ok(0);
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
md5_hex($ret) eq '2b983c4a5ad1f26f7f06f379ea244db6' ? ok(1) : ok(0);
substr($ret,0,20) eq 'GENERATED_ON=Sun Mar' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hosts();
length($ret) eq '445' ? ok(1) : ok(0);
md5_hex($ret) eq '8a89edaac3838ed696080010b325de05' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== HOSTS =====
#A' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_httpstat();
length($ret) eq '155' ? ok(1) : ok(0);
md5_hex($ret) eq '6e37e533eb75639130d1ef0c5d5a20d3' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== HTTPSTAT =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_hwassist_stats();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifconfig_a();
length($ret) eq '1230' ? ok(1) : ok(0);
md5_hex($ret) eq 'b899e1dec9150d697b9cff20be959825' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== IFCONFIG-A ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifgrp_status();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_ifstat_a();
length($ret) eq '8770' ? ok(1) : ok(0);
md5_hex($ret) eq '95c2c3e9a10a685ce55238541aab0cd6' ? ok(1) : ok(0);
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
length($ret) eq '817' ? ok(1) : ok(0);
md5_hex($ret) eq '30dfec84aee42ef1af453b6a0904e5a9' ? ok(1) : ok(0);
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
length($ret) eq '35215' ? ok(1) : ok(0);
md5_hex($ret) eq '30cb519cc37664445d5e50d73f3a977a' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== MESSAGES =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nbtstat_c();
length($ret) eq '23' ? ok(1) : ok(0);
md5_hex($ret) eq '64c65641e084ed16d6b9ea7dba5b6217' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NBTSTAT-C ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_netstat_s();
length($ret) eq '4114' ? ok(1) : ok(0);
md5_hex($ret) eq '8e2d1da3d40acc0d3620f457bb74dadd' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NETSTAT-S ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_cc();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nfsstat_d();
length($ret) eq '5903' ? ok(1) : ok(0);
md5_hex($ret) eq '929548e8ed6240d4b7b844c4d699b59e' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NFSSTAT-D ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nis_info();
length($ret) eq '410' ? ok(1) : ok(0);
md5_hex($ret) eq '0966ef0c25daef2224111664230d82a0' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NIS info =====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_nsswitch_conf();
length($ret) eq '229' ? ok(1) : ok(0);
md5_hex($ret) eq '6a0ed637f1a38dffcddc2bee4da3c2cb' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== NSSWITCH-CONF ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_options();
length($ret) eq '16853' ? ok(1) : ok(0);
md5_hex($ret) eq '7cbfbbe6f1b4acb865fcb4077944d9c2' ? ok(1) : ok(0);
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
length($ret) eq '467' ? ok(1) : ok(0);
md5_hex($ret) eq '2ff2c6cc44953cc29aacc35438b81178' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== QTREE-STATUS =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_quotas();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_rc();
length($ret) eq '435' ? ok(1) : ok(0);
md5_hex($ret) eq '35ab147671d659dcdcc9acd1291f5e1b' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== RC =====
#Rege' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_resolv_conf();
length($ret) eq '149' ? ok(1) : ok(0);
md5_hex($ret) eq '7de9035351b6f150194d584601074cc5' ? ok(1) : ok(0);
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
md5_hex($ret) eq '2c33934a1e9afac1919c85c6828b5853' ? ok(1) : ok(0);
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
length($ret) eq '804' ? ok(1) : ok(0);
md5_hex($ret) eq 'f57d9e24b01e6c577b5ff538792efe43' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-LIST-N ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_list_n_a();
length($ret) eq '75' ? ok(1) : ok(0);
md5_hex($ret) eq '6bc8ebbd4560de16e5de879286272d3a' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-LIST-N-A ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve();
length($ret) eq '405' ? ok(1) : ok(0);
md5_hex($ret) eq 'ef639134010ae2dc5de21e6940011244' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-RESERVE =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_reserve_a();
length($ret) eq '90' ? ok(1) : ok(0);
md5_hex($ret) eq '521022588a7fdfb40a90a803599c75f1' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SNAP-RESERVE-A' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_snap_sched();
length($ret) eq '240' ? ok(1) : ok(0);
md5_hex($ret) eq '1ebb6b175a8e917536d33641799b1015' ? ok(1) : ok(0);
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
length($ret) eq '49' ? ok(1) : ok(0);
md5_hex($ret) eq 'cd404b44add961512816b343e862d8bf' ? ok(1) : ok(0);
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
length($ret) eq '23972' ? ok(1) : ok(0);
md5_hex($ret) eq '54e0e186b2cf39add8bcb2d0dabc2f6e' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== STORAGE =====
' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_sysconfig_a();
length($ret) eq '8582' ? ok(1) : ok(0);
md5_hex($ret) eq '49f2902c850fab89ae97e4d43a8eb54e' ? ok(1) : ok(0);
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
md5_hex($ret) eq '182fec3a0d2d73afcd57487be50e15d8' ? ok(1) : ok(0);
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
md5_hex($ret) eq 'f87fb393651bf5fd9fe6138b61297e5a' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSCONFIG-R ==' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_system_serial_number();
length($ret) eq '65' ? ok(1) : ok(0);
md5_hex($ret) eq 'd16bee9ea82f0ce2c52b81a233d77134' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== SYSTEM SERIAL ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_unowned_disks();
length($ret) eq '0' ? ok(1) : ok(0);
md5_hex($ret) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(1) : ok(0);
substr($ret,0,20) eq '' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_usage();
length($ret) eq '1856' ? ok(1) : ok(0);
md5_hex($ret) eq 'c24a03f78e4eb3c9a72f010a1942f9c2' ? ok(1) : ok(0);
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
length($ret) eq '886' ? ok(1) : ok(0);
md5_hex($ret) eq '98148a8fd5ca820f39cc7268c3f08884' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VIF-STATUS ===' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vlan_stat();
length($ret) eq '113' ? ok(1) : ok(0);
md5_hex($ret) eq '5eaddbb89b9b8ba3cf38cfe6ca70aa1f' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VLAN STAT ====' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_language();
length($ret) eq '269' ? ok(1) : ok(0);
md5_hex($ret) eq '6605d1eb6cd5a6a30e414f7541f5efac' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== VOL-LANGUAGE =' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

$ret = $pna->extract_vol_status();
length($ret) eq '6206' ? ok(1) : ok(0);
md5_hex($ret) eq '9d6c23dfac7bfaaaa3fd2092a02cbd45' ? ok(1) : ok(0);
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
md5_hex($ret) eq '3e045aab0b7bcb97fb3c1e3bed2c88b9' ? ok(1) : ok(0);
substr($ret,0,20) eq '===== X-HEADER DATA ' ? ok(1) : nok(0);
system("ps -o rss -p $$") unless $ENV{AUTOMATED_TESTING};

BEGIN { plan tests => 377 };
