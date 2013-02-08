use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use Test;

my $pna = Parse::NetApp::ASUP->new();
my $asup = read_file('examples/7.2.3/asup01.txt');

my $ret = $pna->load($asup);
$ret == 1 ? ok(1) : nok(1);

my $ver = $pna->asup_version($asup);
$ver eq '7.2.3' ? ok(2) : nok(2);

my $extract_acp_list_all = $pna->extract_acp_list_all();
length($extract_acp_list_all) eq '0' ? ok(3) : nok(3);
md5_hex($extract_acp_list_all) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(4) : nok(4);
substr($extract_acp_list_all,0,20) eq '' ? ok(5) : nok(5);

my $extract_aggr_status = $pna->extract_aggr_status();
length($extract_aggr_status) eq '2972' ? ok(6) : nok(6);
md5_hex($extract_aggr_status) eq '78e3ffcf2d073e67ced5d55c99e60b73' ? ok(7) : nok(7);
substr($extract_aggr_status,0,20) eq '===== AGGR-STATUS ==' ? ok(8) : nok(8);

my $extract_cf_monitor = $pna->extract_cf_monitor();
length($extract_cf_monitor) eq '0' ? ok(9) : nok(9);
md5_hex($extract_cf_monitor) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(10) : nok(10);
substr($extract_cf_monitor,0,20) eq '' ? ok(11) : nok(11);

my $extract_cifs_domaininfo = $pna->extract_cifs_domaininfo();
length($extract_cifs_domaininfo) eq '0' ? ok(12) : nok(12);
md5_hex($extract_cifs_domaininfo) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(13) : nok(13);
substr($extract_cifs_domaininfo,0,20) eq '' ? ok(14) : nok(14);

my $extract_cifs_sessions = $pna->extract_cifs_sessions();
length($extract_cifs_sessions) eq '0' ? ok(15) : nok(15);
md5_hex($extract_cifs_sessions) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(16) : nok(16);
substr($extract_cifs_sessions,0,20) eq '' ? ok(17) : nok(17);

my $extract_cifs_shares = $pna->extract_cifs_shares();
length($extract_cifs_shares) eq '0' ? ok(18) : nok(18);
md5_hex($extract_cifs_shares) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(19) : nok(19);
substr($extract_cifs_shares,0,20) eq '' ? ok(20) : nok(20);

my $extract_cifs_stat = $pna->extract_cifs_stat();
length($extract_cifs_stat) eq '0' ? ok(21) : nok(21);
md5_hex($extract_cifs_stat) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(22) : nok(22);
substr($extract_cifs_stat,0,20) eq '' ? ok(23) : nok(23);

my $extract_cluster_monitor = $pna->extract_cluster_monitor();
length($extract_cluster_monitor) eq '0' ? ok(24) : nok(24);
md5_hex($extract_cluster_monitor) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(25) : nok(25);
substr($extract_cluster_monitor,0,20) eq '' ? ok(26) : nok(26);

my $extract_df = $pna->extract_df();
length($extract_df) eq '5056' ? ok(27) : nok(27);
md5_hex($extract_df) eq '3a18a436bfae96697e97bea824493567' ? ok(28) : nok(28);
substr($extract_df,0,20) eq '===== DF =====
Files' ? ok(29) : nok(29);

my $extract_df_a = $pna->extract_df_a();
length($extract_df_a) eq '470' ? ok(30) : nok(30);
md5_hex($extract_df_a) eq '313af66a6db684eac73778148c8f510d' ? ok(31) : nok(31);
substr($extract_df_a,0,20) eq '===== DF-A =====
Agg' ? ok(32) : nok(32);

my $extract_df_i = $pna->extract_df_i();
length($extract_df_i) eq '2035' ? ok(33) : nok(33);
md5_hex($extract_df_i) eq '014c2150bdf0b55e06fe4ff1756c271a' ? ok(34) : nok(34);
substr($extract_df_i,0,20) eq '===== DF-I =====
Fil' ? ok(35) : nok(35);

my $extract_df_r = $pna->extract_df_r();
length($extract_df_r) eq '5184' ? ok(36) : nok(36);
md5_hex($extract_df_r) eq 'b3b57c986058aa84e016d6850a1dc7b8' ? ok(37) : nok(37);
substr($extract_df_r,0,20) eq '===== DF-R =====
Fil' ? ok(38) : nok(38);

my $extract_df_s = $pna->extract_df_s();
length($extract_df_s) eq '0' ? ok(39) : nok(39);
md5_hex($extract_df_s) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(40) : nok(40);
substr($extract_df_s,0,20) eq '' ? ok(41) : nok(41);

my $extract_dns_info = $pna->extract_dns_info();
length($extract_dns_info) eq '647' ? ok(42) : nok(42);
md5_hex($extract_dns_info) eq 'edd4e387f50ed672ab70d5b25a92a79c' ? ok(43) : nok(43);
substr($extract_dns_info,0,20) eq '===== DNS info =====' ? ok(44) : nok(44);

my $extract_ecc_memory_scrubber_stats = $pna->extract_ecc_memory_scrubber_stats();
length($extract_ecc_memory_scrubber_stats) eq '409' ? ok(45) : nok(45);
md5_hex($extract_ecc_memory_scrubber_stats) eq '6304577bcaeaa1c7f1f08eb25775cdf9' ? ok(46) : nok(46);
substr($extract_ecc_memory_scrubber_stats,0,20) eq '===== ECC MEMORY SCR' ? ok(47) : nok(47);

my $extract_environment = $pna->extract_environment();
length($extract_environment) eq '33381' ? ok(48) : nok(48);
md5_hex($extract_environment) eq '590e15c6bec4f8019de05c32ddd26445' ? ok(49) : nok(49);
substr($extract_environment,0,20) eq '===== ENVIRONMENT ==' ? ok(50) : nok(50);

my $extract_exports = $pna->extract_exports();
length($extract_exports) eq '2188' ? ok(51) : nok(51);
md5_hex($extract_exports) eq 'dcdbbaafa6a1d5e736a60bb2744bf2e5' ? ok(52) : nok(52);
substr($extract_exports,0,20) eq '===== EXPORTS =====
' ? ok(53) : nok(53);

my $extract_failed_disk_registry = $pna->extract_failed_disk_registry();
length($extract_failed_disk_registry) eq '251' ? ok(54) : nok(54);
md5_hex($extract_failed_disk_registry) eq '1276b7da60a650b027a1c1901ead33ac' ? ok(55) : nok(55);
substr($extract_failed_disk_registry,0,20) eq '===== FAILED_DISK_RE' ? ok(56) : nok(56);

my $extract_fc_device_map = $pna->extract_fc_device_map();
length($extract_fc_device_map) eq '1737' ? ok(57) : nok(57);
md5_hex($extract_fc_device_map) eq '183bba07e009d935ad5b52a2658b9baa' ? ok(58) : nok(58);
substr($extract_fc_device_map,0,20) eq '===== FC DEVICE MAP ' ? ok(59) : nok(59);

my $extract_fc_link_stats = $pna->extract_fc_link_stats();
length($extract_fc_link_stats) eq '12835' ? ok(60) : nok(60);
md5_hex($extract_fc_link_stats) eq '7da166d113540c3bd3f041dc96f6cdaf' ? ok(61) : nok(61);
substr($extract_fc_link_stats,0,20) eq '===== FC LINK STATS ' ? ok(62) : nok(62);

my $extract_fc_stats = $pna->extract_fc_stats();
length($extract_fc_stats) eq '29690' ? ok(63) : nok(63);
md5_hex($extract_fc_stats) eq '9ce3b921ea24b13e85de1b7f5dc33684' ? ok(64) : nok(64);
substr($extract_fc_stats,0,20) eq '===== FC STATS =====' ? ok(65) : nok(65);

my $extract_fcp_cfmode = $pna->extract_fcp_cfmode();
length($extract_fcp_cfmode) eq '0' ? ok(66) : nok(66);
md5_hex($extract_fcp_cfmode) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(67) : nok(67);
substr($extract_fcp_cfmode,0,20) eq '' ? ok(68) : nok(68);

my $extract_fcp_initiator_status = $pna->extract_fcp_initiator_status();
length($extract_fcp_initiator_status) eq '0' ? ok(69) : nok(69);
md5_hex($extract_fcp_initiator_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(70) : nok(70);
substr($extract_fcp_initiator_status,0,20) eq '' ? ok(71) : nok(71);

my $extract_fcp_status = $pna->extract_fcp_status();
length($extract_fcp_status) eq '0' ? ok(72) : nok(72);
md5_hex($extract_fcp_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(73) : nok(73);
substr($extract_fcp_status,0,20) eq '' ? ok(74) : nok(74);

my $extract_fcp_target_adapters = $pna->extract_fcp_target_adapters();
length($extract_fcp_target_adapters) eq '0' ? ok(75) : nok(75);
md5_hex($extract_fcp_target_adapters) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(76) : nok(76);
substr($extract_fcp_target_adapters,0,20) eq '' ? ok(77) : nok(77);

my $extract_fcp_target_configuration = $pna->extract_fcp_target_configuration();
length($extract_fcp_target_configuration) eq '0' ? ok(78) : nok(78);
md5_hex($extract_fcp_target_configuration) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(79) : nok(79);
substr($extract_fcp_target_configuration,0,20) eq '' ? ok(80) : nok(80);

my $extract_fcp_target_stats = $pna->extract_fcp_target_stats();
length($extract_fcp_target_stats) eq '0' ? ok(81) : nok(81);
md5_hex($extract_fcp_target_stats) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(82) : nok(82);
substr($extract_fcp_target_stats,0,20) eq '' ? ok(83) : nok(83);

my $extract_flash_card_info = $pna->extract_flash_card_info();
length($extract_flash_card_info) eq '4948' ? ok(84) : nok(84);
md5_hex($extract_flash_card_info) eq 'ee35bd8d2d811bde44a6cc0292fa9c3b' ? ok(85) : nok(85);
substr($extract_flash_card_info,0,20) eq '===== FLASH CARD INF' ? ok(86) : nok(86);

my $extract_fmm_data = $pna->extract_fmm_data();
length($extract_fmm_data) eq '0' ? ok(87) : nok(87);
md5_hex($extract_fmm_data) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(88) : nok(88);
substr($extract_fmm_data,0,20) eq '' ? ok(89) : nok(89);

my $extract_fpolicy = $pna->extract_fpolicy();
length($extract_fpolicy) eq '72' ? ok(90) : nok(90);
md5_hex($extract_fpolicy) eq '277f52a138fec654178bb3bd947144e4' ? ok(91) : nok(91);
substr($extract_fpolicy,0,20) eq '===== FPOLICY =====
' ? ok(92) : nok(92);

my $extract_headers = $pna->extract_headers();
length($extract_headers) eq '163' ? ok(93) : nok(93);
md5_hex($extract_headers) eq '5fb07c22fc19190ab4398cbbf57109be' ? ok(94) : nok(94);
substr($extract_headers,0,20) eq 'GENERATED_ON=Sun Mar' ? ok(95) : nok(95);

my $extract_hosts = $pna->extract_hosts();
length($extract_hosts) eq '306' ? ok(96) : nok(96);
md5_hex($extract_hosts) eq '8c1b2f16f1324cf31efe79682c5ec7b2' ? ok(97) : nok(97);
substr($extract_hosts,0,20) eq '===== HOSTS =====
#A' ? ok(98) : nok(98);

my $extract_httpstat = $pna->extract_httpstat();
length($extract_httpstat) eq '155' ? ok(99) : nok(99);
md5_hex($extract_httpstat) eq '98c26921c5d6377f994ff73d0931bb54' ? ok(100) : nok(100);
substr($extract_httpstat,0,20) eq '===== HTTPSTAT =====' ? ok(101) : nok(101);

my $extract_hwassist_stats = $pna->extract_hwassist_stats();
length($extract_hwassist_stats) eq '0' ? ok(102) : nok(102);
md5_hex($extract_hwassist_stats) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(103) : nok(103);
substr($extract_hwassist_stats,0,20) eq '' ? ok(104) : nok(104);

my $extract_ifconfig_a = $pna->extract_ifconfig_a();
length($extract_ifconfig_a) eq '1100' ? ok(105) : nok(105);
md5_hex($extract_ifconfig_a) eq '6c7ec4ae029c70c320018b7f206fad7c' ? ok(106) : nok(106);
substr($extract_ifconfig_a,0,20) eq '===== IFCONFIG-A ===' ? ok(107) : nok(107);

my $extract_ifgrp_status = $pna->extract_ifgrp_status();
length($extract_ifgrp_status) eq '0' ? ok(108) : nok(108);
md5_hex($extract_ifgrp_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(109) : nok(109);
substr($extract_ifgrp_status,0,20) eq '' ? ok(110) : nok(110);

my $extract_ifstat_a = $pna->extract_ifstat_a();
length($extract_ifstat_a) eq '8226' ? ok(111) : nok(111);
md5_hex($extract_ifstat_a) eq '6de49ae90b0c9a7e98cc84ee9a9a2ace' ? ok(112) : nok(112);
substr($extract_ifstat_a,0,20) eq '===== IFSTAT-A =====' ? ok(113) : nok(113);

my $extract_initiator_groups = $pna->extract_initiator_groups();
length($extract_initiator_groups) eq '0' ? ok(114) : nok(114);
md5_hex($extract_initiator_groups) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(115) : nok(115);
substr($extract_initiator_groups,0,20) eq '' ? ok(116) : nok(116);

my $extract_interconnect_config = $pna->extract_interconnect_config();
length($extract_interconnect_config) eq '0' ? ok(117) : nok(117);
md5_hex($extract_interconnect_config) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(118) : nok(118);
substr($extract_interconnect_config,0,20) eq '' ? ok(119) : nok(119);

my $extract_interconnect_stats = $pna->extract_interconnect_stats();
length($extract_interconnect_stats) eq '0' ? ok(120) : nok(120);
md5_hex($extract_interconnect_stats) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(121) : nok(121);
substr($extract_interconnect_stats,0,20) eq '' ? ok(122) : nok(122);

my $extract_iscsi_alias = $pna->extract_iscsi_alias();
length($extract_iscsi_alias) eq '0' ? ok(123) : nok(123);
md5_hex($extract_iscsi_alias) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(124) : nok(124);
substr($extract_iscsi_alias,0,20) eq '' ? ok(125) : nok(125);

my $extract_iscsi_connections = $pna->extract_iscsi_connections();
length($extract_iscsi_connections) eq '0' ? ok(126) : nok(126);
md5_hex($extract_iscsi_connections) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(127) : nok(127);
substr($extract_iscsi_connections,0,20) eq '' ? ok(128) : nok(128);

my $extract_iscsi_initiator_status = $pna->extract_iscsi_initiator_status();
length($extract_iscsi_initiator_status) eq '0' ? ok(129) : nok(129);
md5_hex($extract_iscsi_initiator_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(130) : nok(130);
substr($extract_iscsi_initiator_status,0,20) eq '' ? ok(131) : nok(131);

my $extract_iscsi_interface = $pna->extract_iscsi_interface();
length($extract_iscsi_interface) eq '0' ? ok(132) : nok(132);
md5_hex($extract_iscsi_interface) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(133) : nok(133);
substr($extract_iscsi_interface,0,20) eq '' ? ok(134) : nok(134);

my $extract_iscsi_interface_accesslist = $pna->extract_iscsi_interface_accesslist();
length($extract_iscsi_interface_accesslist) eq '0' ? ok(135) : nok(135);
md5_hex($extract_iscsi_interface_accesslist) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(136) : nok(136);
substr($extract_iscsi_interface_accesslist,0,20) eq '' ? ok(137) : nok(137);

my $extract_iscsi_isns = $pna->extract_iscsi_isns();
length($extract_iscsi_isns) eq '0' ? ok(138) : nok(138);
md5_hex($extract_iscsi_isns) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(139) : nok(139);
substr($extract_iscsi_isns,0,20) eq '' ? ok(140) : nok(140);

my $extract_iscsi_nodename = $pna->extract_iscsi_nodename();
length($extract_iscsi_nodename) eq '0' ? ok(141) : nok(141);
md5_hex($extract_iscsi_nodename) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(142) : nok(142);
substr($extract_iscsi_nodename,0,20) eq '' ? ok(143) : nok(143);

my $extract_iscsi_portals = $pna->extract_iscsi_portals();
length($extract_iscsi_portals) eq '0' ? ok(144) : nok(144);
md5_hex($extract_iscsi_portals) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(145) : nok(145);
substr($extract_iscsi_portals,0,20) eq '' ? ok(146) : nok(146);

my $extract_iscsi_security = $pna->extract_iscsi_security();
length($extract_iscsi_security) eq '0' ? ok(147) : nok(147);
md5_hex($extract_iscsi_security) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(148) : nok(148);
substr($extract_iscsi_security,0,20) eq '' ? ok(149) : nok(149);

my $extract_iscsi_sessions = $pna->extract_iscsi_sessions();
length($extract_iscsi_sessions) eq '0' ? ok(150) : nok(150);
md5_hex($extract_iscsi_sessions) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(151) : nok(151);
substr($extract_iscsi_sessions,0,20) eq '' ? ok(152) : nok(152);

my $extract_iscsi_statistics = $pna->extract_iscsi_statistics();
length($extract_iscsi_statistics) eq '0' ? ok(153) : nok(153);
md5_hex($extract_iscsi_statistics) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(154) : nok(154);
substr($extract_iscsi_statistics,0,20) eq '' ? ok(155) : nok(155);

my $extract_iscsi_status = $pna->extract_iscsi_status();
length($extract_iscsi_status) eq '0' ? ok(156) : nok(156);
md5_hex($extract_iscsi_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(157) : nok(157);
substr($extract_iscsi_status,0,20) eq '' ? ok(158) : nok(158);

my $extract_iscsi_target_portal_groups = $pna->extract_iscsi_target_portal_groups();
length($extract_iscsi_target_portal_groups) eq '0' ? ok(159) : nok(159);
md5_hex($extract_iscsi_target_portal_groups) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(160) : nok(160);
substr($extract_iscsi_target_portal_groups,0,20) eq '' ? ok(161) : nok(161);

my $extract_lun_config_check = $pna->extract_lun_config_check();
length($extract_lun_config_check) eq '0' ? ok(162) : nok(162);
md5_hex($extract_lun_config_check) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(163) : nok(163);
substr($extract_lun_config_check,0,20) eq '' ? ok(164) : nok(164);

my $extract_lun_configuration = $pna->extract_lun_configuration();
length($extract_lun_configuration) eq '' ? ok(165) : nok(165);
md5_hex($extract_lun_configuration) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(166) : nok(166);
substr($extract_lun_configuration,0,20) eq '' ? ok(167) : nok(167);

my $extract_lun_hist = $pna->extract_lun_hist();
length($extract_lun_hist) eq '0' ? ok(168) : nok(168);
md5_hex($extract_lun_hist) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(169) : nok(169);
substr($extract_lun_hist,0,20) eq '' ? ok(170) : nok(170);

my $extract_lun_statistics = $pna->extract_lun_statistics();
length($extract_lun_statistics) eq '0' ? ok(171) : nok(171);
md5_hex($extract_lun_statistics) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(172) : nok(172);
substr($extract_lun_statistics,0,20) eq '' ? ok(173) : nok(173);

my $extract_messages = $pna->extract_messages();
length($extract_messages) eq '29071' ? ok(174) : nok(174);
md5_hex($extract_messages) eq '4a02b80ca1f99c121a7d0066369c6c58' ? ok(175) : nok(175);
substr($extract_messages,0,20) eq '===== MESSAGES =====' ? ok(176) : nok(176);

my $extract_nbtstat_c = $pna->extract_nbtstat_c();
length($extract_nbtstat_c) eq '23' ? ok(177) : nok(177);
md5_hex($extract_nbtstat_c) eq '64c65641e084ed16d6b9ea7dba5b6217' ? ok(178) : nok(178);
substr($extract_nbtstat_c,0,20) eq '===== NBTSTAT-C ====' ? ok(179) : nok(179);

my $extract_netstat_s = $pna->extract_netstat_s();
length($extract_netstat_s) eq '4019' ? ok(180) : nok(180);
md5_hex($extract_netstat_s) eq '6a55a83b80519391063fe687796b1998' ? ok(181) : nok(181);
substr($extract_netstat_s,0,20) eq '===== NETSTAT-S ====' ? ok(182) : nok(182);

my $extract_nfsstat_cc = $pna->extract_nfsstat_cc();
length($extract_nfsstat_cc) eq '0' ? ok(183) : nok(183);
md5_hex($extract_nfsstat_cc) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(184) : nok(184);
substr($extract_nfsstat_cc,0,20) eq '' ? ok(185) : nok(185);

my $extract_nfsstat_d = $pna->extract_nfsstat_d();
length($extract_nfsstat_d) eq '7043' ? ok(186) : nok(186);
md5_hex($extract_nfsstat_d) eq '3f6f459bbbfd5a88529d9f93624d6b3d' ? ok(187) : nok(187);
substr($extract_nfsstat_d,0,20) eq '===== NFSSTAT-D ====' ? ok(188) : nok(188);

my $extract_nis_info = $pna->extract_nis_info();
length($extract_nis_info) eq '42' ? ok(189) : nok(189);
md5_hex($extract_nis_info) eq '2db8e61e6b2275ed465c235998197c78' ? ok(190) : nok(190);
substr($extract_nis_info,0,20) eq '===== NIS info =====' ? ok(191) : nok(191);

my $extract_nsswitch_conf = $pna->extract_nsswitch_conf();
length($extract_nsswitch_conf) eq '229' ? ok(192) : nok(192);
md5_hex($extract_nsswitch_conf) eq 'cc1085e9894b811ada8f06cfbc14d460' ? ok(193) : nok(193);
substr($extract_nsswitch_conf,0,20) eq '===== NSSWITCH-CONF ' ? ok(194) : nok(194);

my $extract_options = $pna->extract_options();
length($extract_options) eq '15757' ? ok(195) : nok(195);
md5_hex($extract_options) eq 'ee9764386f737e3a5734e2816e6f91cd' ? ok(196) : nok(196);
substr($extract_options,0,20) eq '===== OPTIONS =====
' ? ok(197) : nok(197);

my $extract_portsets = $pna->extract_portsets();
length($extract_portsets) eq '0' ? ok(198) : nok(198);
md5_hex($extract_portsets) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(199) : nok(199);
substr($extract_portsets,0,20) eq '' ? ok(200) : nok(200);

my $extract_priority_show = $pna->extract_priority_show();
length($extract_priority_show) eq '288' ? ok(201) : nok(201);
md5_hex($extract_priority_show) eq '1fb807d3ea399b43bc4816def09ae599' ? ok(202) : nok(202);
substr($extract_priority_show,0,20) eq '===== PRIORITY_SHOW ' ? ok(203) : nok(203);

my $extract_qtree_status = $pna->extract_qtree_status();
length($extract_qtree_status) eq '1610' ? ok(204) : nok(204);
md5_hex($extract_qtree_status) eq '4999f48f9d13c4a3f2ba9a7dbdb4123c' ? ok(205) : nok(205);
substr($extract_qtree_status,0,20) eq '===== QTREE-STATUS =' ? ok(206) : nok(206);

my $extract_quotas = $pna->extract_quotas();
length($extract_quotas) eq '0' ? ok(207) : nok(207);
md5_hex($extract_quotas) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(208) : nok(208);
substr($extract_quotas,0,20) eq '' ? ok(209) : nok(209);

my $extract_rc = $pna->extract_rc();
length($extract_rc) eq '458' ? ok(210) : nok(210);
md5_hex($extract_rc) eq '390168cd8d6daa284921efcf6c784c7c' ? ok(211) : nok(211);
substr($extract_rc,0,20) eq '===== RC =====
#Rege' ? ok(212) : nok(212);

my $extract_resolv_conf = $pna->extract_resolv_conf();
length($extract_resolv_conf) eq '124' ? ok(213) : nok(213);
md5_hex($extract_resolv_conf) eq 'c067322ed9f1c173e9c9c4be272bd365' ? ok(214) : nok(214);
substr($extract_resolv_conf,0,20) eq '===== RESOLV-CONF ==' ? ok(215) : nok(215);

my $extract_route_gsn = $pna->extract_route_gsn();
length($extract_route_gsn) eq '0' ? ok(216) : nok(216);
md5_hex($extract_route_gsn) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(217) : nok(217);
substr($extract_route_gsn,0,20) eq '' ? ok(218) : nok(218);

my $extract_sas_adapter_state = $pna->extract_sas_adapter_state();
length($extract_sas_adapter_state) eq '54' ? ok(219) : nok(219);
md5_hex($extract_sas_adapter_state) eq 'c87ff86b39c04817aa859f701716bb07' ? ok(220) : nok(220);
substr($extract_sas_adapter_state,0,20) eq '===== SAS ADAPTER ST' ? ok(221) : nok(221);

my $extract_sas_dev_stats = $pna->extract_sas_dev_stats();
length($extract_sas_dev_stats) eq '50' ? ok(222) : nok(222);
md5_hex($extract_sas_dev_stats) eq 'b33421490bca5adb39aa7f0689013980' ? ok(223) : nok(223);
substr($extract_sas_dev_stats,0,20) eq '===== SAS DEV STATS ' ? ok(224) : nok(224);

my $extract_sas_expander_map = $pna->extract_sas_expander_map();
length($extract_sas_expander_map) eq '53' ? ok(225) : nok(225);
md5_hex($extract_sas_expander_map) eq 'c415e21c5c7d59e715bd13b6a04755b2' ? ok(226) : nok(226);
substr($extract_sas_expander_map,0,20) eq '===== SAS EXPANDER M' ? ok(227) : nok(227);

my $extract_sas_expander_phy_state = $pna->extract_sas_expander_phy_state();
length($extract_sas_expander_phy_state) eq '59' ? ok(228) : nok(228);
md5_hex($extract_sas_expander_phy_state) eq '351bf69e737c80403addfb9f92dca68f' ? ok(229) : nok(229);
substr($extract_sas_expander_phy_state,0,20) eq '===== SAS EXPANDER P' ? ok(230) : nok(230);

my $extract_sas_shelf = $pna->extract_sas_shelf();
length($extract_sas_shelf) eq '46' ? ok(231) : nok(231);
md5_hex($extract_sas_shelf) eq '14cf236995f99ded93cc5bcb465f39d7' ? ok(232) : nok(232);
substr($extract_sas_shelf,0,20) eq '===== SAS SHELF ====' ? ok(233) : nok(233);

my $extract_service_usage = $pna->extract_service_usage();
length($extract_service_usage) eq '467' ? ok(234) : nok(234);
md5_hex($extract_service_usage) eq 'b424a895897740eef8d623a3838bf037' ? ok(235) : nok(235);
substr($extract_service_usage,0,20) eq '===== SERVICE USAGE ' ? ok(236) : nok(236);

my $extract_shelf_log_esh = $pna->extract_shelf_log_esh();
length($extract_shelf_log_esh) eq '0' ? ok(237) : nok(237);
md5_hex($extract_shelf_log_esh) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(238) : nok(238);
substr($extract_shelf_log_esh,0,20) eq '' ? ok(239) : nok(239);

my $extract_shelf_log_iom = $pna->extract_shelf_log_iom();
length($extract_shelf_log_iom) eq '0' ? ok(240) : nok(240);
md5_hex($extract_shelf_log_iom) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(241) : nok(241);
substr($extract_shelf_log_iom,0,20) eq '' ? ok(242) : nok(242);

my $extract_sis_stat = $pna->extract_sis_stat();
length($extract_sis_stat) eq '0' ? ok(243) : nok(243);
md5_hex($extract_sis_stat) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(244) : nok(244);
substr($extract_sis_stat,0,20) eq '' ? ok(245) : nok(245);

my $extract_sis_stat_l = $pna->extract_sis_stat_l();
length($extract_sis_stat_l) eq '0' ? ok(246) : nok(246);
md5_hex($extract_sis_stat_l) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(247) : nok(247);
substr($extract_sis_stat_l,0,20) eq '' ? ok(248) : nok(248);

my $extract_sis_status = $pna->extract_sis_status();
length($extract_sis_status) eq '0' ? ok(249) : nok(249);
md5_hex($extract_sis_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(250) : nok(250);
substr($extract_sis_status,0,20) eq '' ? ok(251) : nok(251);

my $extract_sis_status_l = $pna->extract_sis_status_l();
length($extract_sis_status_l) eq '0' ? ok(252) : nok(252);
md5_hex($extract_sis_status_l) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(253) : nok(253);
substr($extract_sis_status_l,0,20) eq '' ? ok(254) : nok(254);

my $extract_sm_allow = $pna->extract_sm_allow();
length($extract_sm_allow) eq '0' ? ok(255) : nok(255);
md5_hex($extract_sm_allow) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(256) : nok(256);
substr($extract_sm_allow,0,20) eq '' ? ok(257) : nok(257);

my $extract_sm_conf = $pna->extract_sm_conf();
length($extract_sm_conf) eq '0' ? ok(258) : nok(258);
md5_hex($extract_sm_conf) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(259) : nok(259);
substr($extract_sm_conf,0,20) eq '' ? ok(260) : nok(260);

my $extract_snap_list_n = $pna->extract_snap_list_n();
length($extract_snap_list_n) eq '1714' ? ok(261) : nok(261);
md5_hex($extract_snap_list_n) eq 'f959bfeb0d643e786257c0ff52ddf1c3' ? ok(262) : nok(262);
substr($extract_snap_list_n,0,20) eq '===== SNAP-LIST-N ==' ? ok(263) : nok(263);

my $extract_snap_list_n_a = $pna->extract_snap_list_n_a();
length($extract_snap_list_n_a) eq '345' ? ok(264) : nok(264);
md5_hex($extract_snap_list_n_a) eq 'f8d14fc0b5b16b94b1ca9194b773ba32' ? ok(265) : nok(265);
substr($extract_snap_list_n_a,0,20) eq '===== SNAP-LIST-N-A ' ? ok(266) : nok(266);

my $extract_snap_reserve = $pna->extract_snap_reserve();
length($extract_snap_reserve) eq '1857' ? ok(267) : nok(267);
md5_hex($extract_snap_reserve) eq '5bcdcf15cf4a9437c86885dc758c8a65' ? ok(268) : nok(268);
substr($extract_snap_reserve,0,20) eq '===== SNAP-RESERVE =' ? ok(269) : nok(269);

my $extract_snap_reserve_a = $pna->extract_snap_reserve_a();
length($extract_snap_reserve_a) eq '222' ? ok(270) : nok(270);
md5_hex($extract_snap_reserve_a) eq '405c3bd56e572dd56a105b8cfbf220b9' ? ok(271) : nok(271);
substr($extract_snap_reserve_a,0,20) eq '===== SNAP-RESERVE-A' ? ok(272) : nok(272);

my $extract_snap_sched = $pna->extract_snap_sched();
length($extract_snap_sched) eq '646' ? ok(273) : nok(273);
md5_hex($extract_snap_sched) eq '41e2cc86d50b2d4c8f81a836f7cfd4e9' ? ok(274) : nok(274);
substr($extract_snap_sched,0,20) eq '===== SNAP-SCHED ===' ? ok(275) : nok(275);

my $extract_snap_sched_a = $pna->extract_snap_sched_a();
length($extract_snap_sched_a) eq '103' ? ok(276) : nok(276);
md5_hex($extract_snap_sched_a) eq '0d0a3b94d9e1542bb55c051de87bfae3' ? ok(277) : nok(277);
substr($extract_snap_sched_a,0,20) eq '===== SNAP-SCHED-A =' ? ok(278) : nok(278);

my $extract_snap_status = $pna->extract_snap_status();
length($extract_snap_status) eq '1754' ? ok(279) : nok(279);
md5_hex($extract_snap_status) eq 'b0a558834d7a4ab8b7c7dca198908801' ? ok(280) : nok(280);
substr($extract_snap_status,0,20) eq '===== SNAP-STATUS ==' ? ok(281) : nok(281);

my $extract_snap_status_a = $pna->extract_snap_status_a();
length($extract_snap_status_a) eq '698' ? ok(282) : nok(282);
md5_hex($extract_snap_status_a) eq 'f9743a2fd7a6a9bf238f9bb7c9d49464' ? ok(283) : nok(283);
substr($extract_snap_status_a,0,20) eq '===== SNAP-STATUS-A ' ? ok(284) : nok(284);

my $extract_snapmirror_destinations = $pna->extract_snapmirror_destinations();
length($extract_snapmirror_destinations) eq '0' ? ok(285) : nok(285);
md5_hex($extract_snapmirror_destinations) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(286) : nok(286);
substr($extract_snapmirror_destinations,0,20) eq '' ? ok(287) : nok(287);

my $extract_snapmirror_status = $pna->extract_snapmirror_status();
length($extract_snapmirror_status) eq '0' ? ok(288) : nok(288);
md5_hex($extract_snapmirror_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(289) : nok(289);
substr($extract_snapmirror_status,0,20) eq '' ? ok(290) : nok(290);

my $extract_snapvault_destinations = $pna->extract_snapvault_destinations();
length($extract_snapvault_destinations) eq '0' ? ok(291) : nok(291);
md5_hex($extract_snapvault_destinations) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(292) : nok(292);
substr($extract_snapvault_destinations,0,20) eq '' ? ok(293) : nok(293);

my $extract_snapvault_snap_sched = $pna->extract_snapvault_snap_sched();
length($extract_snapvault_snap_sched) eq '0' ? ok(294) : nok(294);
md5_hex($extract_snapvault_snap_sched) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(295) : nok(295);
substr($extract_snapvault_snap_sched,0,20) eq '' ? ok(296) : nok(296);

my $extract_snapvault_status_l = $pna->extract_snapvault_status_l();
length($extract_snapvault_status_l) eq '0' ? ok(297) : nok(297);
md5_hex($extract_snapvault_status_l) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(298) : nok(298);
substr($extract_snapvault_status_l,0,20) eq '' ? ok(299) : nok(299);

my $extract_snaplock = $pna->extract_snaplock();
length($extract_snaplock) eq '0' ? ok(300) : nok(300);
md5_hex($extract_snaplock) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(301) : nok(301);
substr($extract_snaplock,0,20) eq '' ? ok(302) : nok(302);

my $extract_snaplock_clock = $pna->extract_snaplock_clock();
length($extract_snaplock_clock) eq '0' ? ok(303) : nok(303);
md5_hex($extract_snaplock_clock) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(304) : nok(304);
substr($extract_snaplock_clock,0,20) eq '' ? ok(305) : nok(305);

my $extract_software_licenses = $pna->extract_software_licenses();
length($extract_software_licenses) eq '1280' ? ok(306) : nok(306);
md5_hex($extract_software_licenses) eq 'cfa9b1faae943076bbbf856e887b3302' ? ok(307) : nok(307);
substr($extract_software_licenses,0,20) eq '===== SOFTWARE LICEN' ? ok(308) : nok(308);

my $extract_ssh = $pna->extract_ssh();
length($extract_ssh) eq '109' ? ok(309) : nok(309);
md5_hex($extract_ssh) eq 'd11440fcaf83d3f35ff2817bcc2d6832' ? ok(310) : nok(310);
substr($extract_ssh,0,20) eq '===== SSH =====
SSH1' ? ok(311) : nok(311);

my $extract_storage = $pna->extract_storage();
length($extract_storage) eq '290618' ? ok(312) : nok(312);
md5_hex($extract_storage) eq 'b6f40616c90711f45d384053b0c3c2bd' ? ok(313) : nok(313);
substr($extract_storage,0,20) eq '===== STORAGE =====
' ? ok(314) : nok(314);

my $extract_sysconfig_a = $pna->extract_sysconfig_a();
length($extract_sysconfig_a) eq '15865' ? ok(315) : nok(315);
md5_hex($extract_sysconfig_a) eq 'cf891a2a439cb6e88707ce0dff9aa85e' ? ok(316) : nok(316);
substr($extract_sysconfig_a,0,20) eq '===== SYSCONFIG-A ==' ? ok(317) : nok(317);

my $extract_sysconfig_ac = $pna->extract_sysconfig_ac();
length($extract_sysconfig_ac) eq '0' ? ok(318) : nok(318);
md5_hex($extract_sysconfig_ac) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(319) : nok(319);
substr($extract_sysconfig_ac,0,20) eq '' ? ok(320) : nok(320);

my $extract_sysconfig_c = $pna->extract_sysconfig_c();
length($extract_sysconfig_c) eq '71' ? ok(321) : nok(321);
md5_hex($extract_sysconfig_c) eq '130e776967aeedcb74176ab0f96778a9' ? ok(322) : nok(322);
substr($extract_sysconfig_c,0,20) eq '===== SYSCONFIG-C ==' ? ok(323) : nok(323);

my $extract_sysconfig_d = $pna->extract_sysconfig_d();
length($extract_sysconfig_d) eq '7027' ? ok(324) : nok(324);
md5_hex($extract_sysconfig_d) eq 'bd4f578d34123b0c26945d6e858cd7be' ? ok(325) : nok(325);
substr($extract_sysconfig_d,0,20) eq '===== SYSCONFIG-D ==' ? ok(326) : nok(326);

my $extract_sysconfig_hardware_ids = $pna->extract_sysconfig_hardware_ids();
length($extract_sysconfig_hardware_ids) eq '137' ? ok(327) : nok(327);
md5_hex($extract_sysconfig_hardware_ids) eq 'e2c8433ab69d86a4ee6cead9b8f15817' ? ok(328) : nok(328);
substr($extract_sysconfig_hardware_ids,0,20) eq '===== SYSCONFIG HARD' ? ok(329) : nok(329);

my $extract_sysconfig_m = $pna->extract_sysconfig_m();
length($extract_sysconfig_m) eq '9758' ? ok(330) : nok(330);
md5_hex($extract_sysconfig_m) eq '33be89a207259a323a15c3925568bb9f' ? ok(331) : nok(331);
substr($extract_sysconfig_m,0,20) eq '===== SYSCONFIG-M ==' ? ok(332) : nok(332);

my $extract_sysconfig_r = $pna->extract_sysconfig_r();
length($extract_sysconfig_r) eq '15899' ? ok(333) : nok(333);
md5_hex($extract_sysconfig_r) eq 'ef11d3668c121a4026717a7fed6a87f3' ? ok(334) : nok(334);
substr($extract_sysconfig_r,0,20) eq '===== SYSCONFIG-R ==' ? ok(335) : nok(335);

my $extract_system_serial_number = $pna->extract_system_serial_number();
length($extract_system_serial_number) eq '65' ? ok(336) : nok(336);
md5_hex($extract_system_serial_number) eq '2bcd017017d06bdcd4845753a90b40fa' ? ok(337) : nok(337);
substr($extract_system_serial_number,0,20) eq '===== SYSTEM SERIAL ' ? ok(338) : nok(338);

my $extract_unowned_disks = $pna->extract_unowned_disks();
length($extract_unowned_disks) eq '0' ? ok(339) : nok(339);
md5_hex($extract_unowned_disks) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(340) : nok(340);
substr($extract_unowned_disks,0,20) eq '' ? ok(341) : nok(341);

my $extract_usage = $pna->extract_usage();
length($extract_usage) eq '3166' ? ok(342) : nok(342);
md5_hex($extract_usage) eq 'c0145ba73435a8768c25f174c9047176' ? ok(343) : nok(343);
substr($extract_usage,0,20) eq '===== USAGE =====
ap' ? ok(344) : nok(344);

my $extract_usermap_cfg = $pna->extract_usermap_cfg();
length($extract_usermap_cfg) eq '0' ? ok(345) : nok(345);
md5_hex($extract_usermap_cfg) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(346) : nok(346);
substr($extract_usermap_cfg,0,20) eq '' ? ok(347) : nok(347);

my $extract_vfiler_startup_times = $pna->extract_vfiler_startup_times();
length($extract_vfiler_startup_times) eq '0' ? ok(348) : nok(348);
md5_hex($extract_vfiler_startup_times) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(349) : nok(349);
substr($extract_vfiler_startup_times,0,20) eq '' ? ok(350) : nok(350);

my $extract_vfilers = $pna->extract_vfilers();
length($extract_vfilers) eq '0' ? ok(351) : nok(351);
md5_hex($extract_vfilers) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(352) : nok(352);
substr($extract_vfilers,0,20) eq '' ? ok(353) : nok(353);

my $extract_vif_status = $pna->extract_vif_status();
length($extract_vif_status) eq '1661' ? ok(354) : nok(354);
md5_hex($extract_vif_status) eq '93bd013da9c63cecda270e53ea9160eb' ? ok(355) : nok(355);
substr($extract_vif_status,0,20) eq '===== VIF-STATUS ===' ? ok(356) : nok(356);

my $extract_vlan_stat = $pna->extract_vlan_stat();
length($extract_vlan_stat) eq '113' ? ok(357) : nok(357);
md5_hex($extract_vlan_stat) eq '5eaddbb89b9b8ba3cf38cfe6ca70aa1f' ? ok(358) : nok(358);
substr($extract_vlan_stat,0,20) eq '===== VLAN STAT ====' ? ok(359) : nok(359);

my $extract_vol_language = $pna->extract_vol_language();
length($extract_vol_language) eq '1198' ? ok(360) : nok(360);
md5_hex($extract_vol_language) eq '837769cf531be71dd861fbaf851ed5b5' ? ok(361) : nok(361);
substr($extract_vol_language,0,20) eq '===== VOL-LANGUAGE =' ? ok(362) : nok(362);

my $extract_vol_status = $pna->extract_vol_status();
length($extract_vol_status) eq '50740' ? ok(363) : nok(363);
md5_hex($extract_vol_status) eq '91ce851907bd477968ca8659fa970c7f' ? ok(364) : nok(364);
substr($extract_vol_status,0,20) eq '===== VOL-STATUS ===' ? ok(365) : nok(365);

my $extract_vscan = $pna->extract_vscan();
length($extract_vscan) eq '274' ? ok(366) : nok(366);
md5_hex($extract_vscan) eq '818f8a21bd2fe1d2858a015a5e490013' ? ok(367) : nok(367);
substr($extract_vscan,0,20) eq '===== VSCAN =====

V' ? ok(368) : nok(368);

my $extract_vscan_options = $pna->extract_vscan_options();
length($extract_vscan_options) eq '161' ? ok(369) : nok(369);
md5_hex($extract_vscan_options) eq '946ecde9bdb4ab1f54b89833dda0a0f9' ? ok(370) : nok(370);
substr($extract_vscan_options,0,20) eq '===== VSCAN OPTIONS ' ? ok(371) : nok(371);

my $extract_vscan_scanners = $pna->extract_vscan_scanners();
length($extract_vscan_scanners) eq '60' ? ok(372) : nok(372);
md5_hex($extract_vscan_scanners) eq '9794c533b37cc0ee4fbce706067161ab' ? ok(373) : nok(373);
substr($extract_vscan_scanners,0,20) eq '===== VSCAN SCANNERS' ? ok(374) : nok(374);

my $extract_xheader = $pna->extract_xheader();
length($extract_xheader) eq '612' ? ok(375) : nok(375);
md5_hex($extract_xheader) eq '98a06bd5360738ca41ff262cd718f1ee' ? ok(376) : nok(376);
substr($extract_xheader,0,20) eq '===== X-HEADER DATA ' ? ok(377) : nok(377);

BEGIN { plan tests => 377 };
