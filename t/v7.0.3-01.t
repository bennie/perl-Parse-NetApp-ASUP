use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use Test;

my $pna = Parse::NetApp::ASUP->new();
my $asup = read_file('examples/7.0.3/asup01.txt');

my $ret = $pna->load($asup);
$ret == 1 ? ok(1) : nok(1);

my $ver = $pna->asup_version($asup);
$ver eq '7.0.3' ? ok(2) : nok(2);

my $extract_acp_list_all = $pna->extract_acp_list_all();
length($extract_acp_list_all) eq '0' ? ok(3) : nok(3);
md5_hex($extract_acp_list_all) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(4) : nok(4);
substr($extract_acp_list_all,0,20) eq '' ? ok(5) : nok(5);

my $extract_aggr_status = $pna->extract_aggr_status();
length($extract_aggr_status) eq '947' ? ok(6) : nok(6);
md5_hex($extract_aggr_status) eq '854ec0966d6eed3080ace1119131f995' ? ok(7) : nok(7);
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
length($extract_cluster_monitor) eq '2743' ? ok(24) : nok(24);
md5_hex($extract_cluster_monitor) eq '2bb6ea28de5e1be7e05198bcb07fef26' ? ok(25) : nok(25);
substr($extract_cluster_monitor,0,20) eq '===== CLUSTER MONITO' ? ok(26) : nok(26);

my $extract_df = $pna->extract_df();
length($extract_df) eq '1099' ? ok(27) : nok(27);
md5_hex($extract_df) eq '6e94e9a6bcf18cf2ffe92635d62a7a6c' ? ok(28) : nok(28);
substr($extract_df,0,20) eq '===== DF =====
Files' ? ok(29) : nok(29);

my $extract_df_a = $pna->extract_df_a();
length($extract_df_a) eq '210' ? ok(30) : nok(30);
md5_hex($extract_df_a) eq '0fe6509d674d9e2b649d1b6509d7e2cf' ? ok(31) : nok(31);
substr($extract_df_a,0,20) eq '===== DF-A =====
Agg' ? ok(32) : nok(32);

my $extract_df_i = $pna->extract_df_i();
length($extract_df_i) eq '482' ? ok(33) : nok(33);
md5_hex($extract_df_i) eq '969e5b643db36faa0f088f95191f39e1' ? ok(34) : nok(34);
substr($extract_df_i,0,20) eq '===== DF-I =====
Fil' ? ok(35) : nok(35);

my $extract_df_r = $pna->extract_df_r();
length($extract_df_r) eq '1123' ? ok(36) : nok(36);
md5_hex($extract_df_r) eq '9b1f4d96f43f79f9984f9644dda477df' ? ok(37) : nok(37);
substr($extract_df_r,0,20) eq '===== DF-R =====
Fil' ? ok(38) : nok(38);

my $extract_df_s = $pna->extract_df_s();
length($extract_df_s) eq '0' ? ok(39) : nok(39);
md5_hex($extract_df_s) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(40) : nok(40);
substr($extract_df_s,0,20) eq '' ? ok(41) : nok(41);

my $extract_dns_info = $pna->extract_dns_info();
length($extract_dns_info) eq '608' ? ok(42) : nok(42);
md5_hex($extract_dns_info) eq '60a73d9b78e91e55006145f912a50503' ? ok(43) : nok(43);
substr($extract_dns_info,0,20) eq '===== DNS info =====' ? ok(44) : nok(44);

my $extract_ecc_memory_scrubber_stats = $pna->extract_ecc_memory_scrubber_stats();
length($extract_ecc_memory_scrubber_stats) eq '409' ? ok(45) : nok(45);
md5_hex($extract_ecc_memory_scrubber_stats) eq '690def71e3b0e573256f1c1490b6421e' ? ok(46) : nok(46);
substr($extract_ecc_memory_scrubber_stats,0,20) eq '===== ECC MEMORY SCR' ? ok(47) : nok(47);

my $extract_environment = $pna->extract_environment();
length($extract_environment) eq '4204' ? ok(48) : nok(48);
md5_hex($extract_environment) eq '6495b6fdeaf446a72187ebf3467dc0d2' ? ok(49) : nok(49);
substr($extract_environment,0,20) eq '===== ENVIRONMENT ==' ? ok(50) : nok(50);

my $extract_exports = $pna->extract_exports();
length($extract_exports) eq '650' ? ok(51) : nok(51);
md5_hex($extract_exports) eq '340f9cd82ece422ac03e3e0dd2820777' ? ok(52) : nok(52);
substr($extract_exports,0,20) eq '===== EXPORTS =====
' ? ok(53) : nok(53);

my $extract_failed_disk_registry = $pna->extract_failed_disk_registry();
length($extract_failed_disk_registry) eq '251' ? ok(54) : nok(54);
md5_hex($extract_failed_disk_registry) eq '919320345f38b319db868d68499dd371' ? ok(55) : nok(55);
substr($extract_failed_disk_registry,0,20) eq '===== FAILED_DISK_RE' ? ok(56) : nok(56);

my $extract_fc_device_map = $pna->extract_fc_device_map();
length($extract_fc_device_map) eq '706' ? ok(57) : nok(57);
md5_hex($extract_fc_device_map) eq '5773c7e9ee70c54a97042c509ed1e02b' ? ok(58) : nok(58);
substr($extract_fc_device_map,0,20) eq '===== FC DEVICE MAP ' ? ok(59) : nok(59);

my $extract_fc_link_stats = $pna->extract_fc_link_stats();
length($extract_fc_link_stats) eq '3459' ? ok(60) : nok(60);
md5_hex($extract_fc_link_stats) eq 'eb56835748c829fc866ae8776e531521' ? ok(61) : nok(61);
substr($extract_fc_link_stats,0,20) eq '===== FC LINK STATS ' ? ok(62) : nok(62);

my $extract_fc_stats = $pna->extract_fc_stats();
length($extract_fc_stats) eq '21866' ? ok(63) : nok(63);
md5_hex($extract_fc_stats) eq '7c418669c336d6e6bb844a2060cfd6b6' ? ok(64) : nok(64);
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
length($extract_flash_card_info) eq '1533' ? ok(84) : nok(84);
md5_hex($extract_flash_card_info) eq '9a67debc8b23bb73cd4796c332861c98' ? ok(85) : nok(85);
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
length($extract_headers) eq '300' ? ok(93) : nok(93);
md5_hex($extract_headers) eq 'b8c3265bc8640e4631ebe03f3525483f' ? ok(94) : nok(94);
substr($extract_headers,0,20) eq 'GENERATED_ON=Sun Mar' ? ok(95) : nok(95);

my $extract_hosts = $pna->extract_hosts();
length($extract_hosts) eq '416' ? ok(96) : nok(96);
md5_hex($extract_hosts) eq '6684b6272a64e8118c944fd941f5ef34' ? ok(97) : nok(97);
substr($extract_hosts,0,20) eq '===== HOSTS =====
#A' ? ok(98) : nok(98);

my $extract_httpstat = $pna->extract_httpstat();
length($extract_httpstat) eq '155' ? ok(99) : nok(99);
md5_hex($extract_httpstat) eq '6e0fe0a8c1d91dbca8139ae14491fc1a' ? ok(100) : nok(100);
substr($extract_httpstat,0,20) eq '===== HTTPSTAT =====' ? ok(101) : nok(101);

my $extract_hwassist_stats = $pna->extract_hwassist_stats();
length($extract_hwassist_stats) eq '0' ? ok(102) : nok(102);
md5_hex($extract_hwassist_stats) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(103) : nok(103);
substr($extract_hwassist_stats,0,20) eq '' ? ok(104) : nok(104);

my $extract_ifconfig_a = $pna->extract_ifconfig_a();
length($extract_ifconfig_a) eq '1225' ? ok(105) : nok(105);
md5_hex($extract_ifconfig_a) eq 'c1b9f8b3570852d601d8559105ddcc44' ? ok(106) : nok(106);
substr($extract_ifconfig_a,0,20) eq '===== IFCONFIG-A ===' ? ok(107) : nok(107);

my $extract_ifgrp_status = $pna->extract_ifgrp_status();
length($extract_ifgrp_status) eq '0' ? ok(108) : nok(108);
md5_hex($extract_ifgrp_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(109) : nok(109);
substr($extract_ifgrp_status,0,20) eq '' ? ok(110) : nok(110);

my $extract_ifstat_a = $pna->extract_ifstat_a();
length($extract_ifstat_a) eq '8762' ? ok(111) : nok(111);
md5_hex($extract_ifstat_a) eq '8cb614a808d0bb66379b6fd9e196da72' ? ok(112) : nok(112);
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
length($extract_interconnect_stats) eq '818' ? ok(120) : nok(120);
md5_hex($extract_interconnect_stats) eq '72b202d67594d6a96602d4082d9fddb7' ? ok(121) : nok(121);
substr($extract_interconnect_stats,0,20) eq '===== INTERCONNECT S' ? ok(122) : nok(122);

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
length($extract_lun_configuration) eq '104' ? ok(165) : nok(165);
md5_hex($extract_lun_configuration) eq '3d77c4ae4c47c5994a4c1f68ae3af16f' ? ok(166) : nok(166);
substr($extract_lun_configuration,0,20) eq '	slot 2: FC Host Ada' ? ok(167) : nok(167);

my $extract_lun_hist = $pna->extract_lun_hist();
length($extract_lun_hist) eq '0' ? ok(168) : nok(168);
md5_hex($extract_lun_hist) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(169) : nok(169);
substr($extract_lun_hist,0,20) eq '' ? ok(170) : nok(170);

my $extract_lun_statistics = $pna->extract_lun_statistics();
length($extract_lun_statistics) eq '0' ? ok(171) : nok(171);
md5_hex($extract_lun_statistics) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(172) : nok(172);
substr($extract_lun_statistics,0,20) eq '' ? ok(173) : nok(173);

my $extract_messages = $pna->extract_messages();
length($extract_messages) eq '35003' ? ok(174) : nok(174);
md5_hex($extract_messages) eq 'ee01589fcf9d267fba0a890ed70f6a14' ? ok(175) : nok(175);
substr($extract_messages,0,20) eq '===== MESSAGES =====' ? ok(176) : nok(176);

my $extract_nbtstat_c = $pna->extract_nbtstat_c();
length($extract_nbtstat_c) eq '23' ? ok(177) : nok(177);
md5_hex($extract_nbtstat_c) eq '64c65641e084ed16d6b9ea7dba5b6217' ? ok(178) : nok(178);
substr($extract_nbtstat_c,0,20) eq '===== NBTSTAT-C ====' ? ok(179) : nok(179);

my $extract_netstat_s = $pna->extract_netstat_s();
length($extract_netstat_s) eq '4114' ? ok(180) : nok(180);
md5_hex($extract_netstat_s) eq '449e1994b4460edb43226117b64acfcd' ? ok(181) : nok(181);
substr($extract_netstat_s,0,20) eq '===== NETSTAT-S ====' ? ok(182) : nok(182);

my $extract_nfsstat_cc = $pna->extract_nfsstat_cc();
length($extract_nfsstat_cc) eq '0' ? ok(183) : nok(183);
md5_hex($extract_nfsstat_cc) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(184) : nok(184);
substr($extract_nfsstat_cc,0,20) eq '' ? ok(185) : nok(185);

my $extract_nfsstat_d = $pna->extract_nfsstat_d();
length($extract_nfsstat_d) eq '5863' ? ok(186) : nok(186);
md5_hex($extract_nfsstat_d) eq 'e76218026683fbb2b4d3d5bd09e976b7' ? ok(187) : nok(187);
substr($extract_nfsstat_d,0,20) eq '===== NFSSTAT-D ====' ? ok(188) : nok(188);

my $extract_nis_info = $pna->extract_nis_info();
length($extract_nis_info) eq '410' ? ok(189) : nok(189);
md5_hex($extract_nis_info) eq '5621ea55a69473d7cb76ab1c48f6c847' ? ok(190) : nok(190);
substr($extract_nis_info,0,20) eq '===== NIS info =====' ? ok(191) : nok(191);

my $extract_nsswitch_conf = $pna->extract_nsswitch_conf();
length($extract_nsswitch_conf) eq '229' ? ok(192) : nok(192);
md5_hex($extract_nsswitch_conf) eq '935d88850a1df1ce3b1c619f12f1d897' ? ok(193) : nok(193);
substr($extract_nsswitch_conf,0,20) eq '===== NSSWITCH-CONF ' ? ok(194) : nok(194);

my $extract_options = $pna->extract_options();
length($extract_options) eq '16874' ? ok(195) : nok(195);
md5_hex($extract_options) eq 'b0c6cbeff7559579cf69129edbde639e' ? ok(196) : nok(196);
substr($extract_options,0,20) eq '===== OPTIONS =====
' ? ok(197) : nok(197);

my $extract_portsets = $pna->extract_portsets();
length($extract_portsets) eq '0' ? ok(198) : nok(198);
md5_hex($extract_portsets) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(199) : nok(199);
substr($extract_portsets,0,20) eq '' ? ok(200) : nok(200);

my $extract_priority_show = $pna->extract_priority_show();
length($extract_priority_show) eq '0' ? ok(201) : nok(201);
md5_hex($extract_priority_show) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(202) : nok(202);
substr($extract_priority_show,0,20) eq '' ? ok(203) : nok(203);

my $extract_qtree_status = $pna->extract_qtree_status();
length($extract_qtree_status) eq '757' ? ok(204) : nok(204);
md5_hex($extract_qtree_status) eq 'e066663921b6881bdf30787032448a24' ? ok(205) : nok(205);
substr($extract_qtree_status,0,20) eq '===== QTREE-STATUS =' ? ok(206) : nok(206);

my $extract_quotas = $pna->extract_quotas();
length($extract_quotas) eq '0' ? ok(207) : nok(207);
md5_hex($extract_quotas) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(208) : nok(208);
substr($extract_quotas,0,20) eq '' ? ok(209) : nok(209);

my $extract_rc = $pna->extract_rc();
length($extract_rc) eq '429' ? ok(210) : nok(210);
md5_hex($extract_rc) eq '129bc1eb8d1aeedc2b30f9695671aa56' ? ok(211) : nok(211);
substr($extract_rc,0,20) eq '===== RC =====
#Rege' ? ok(212) : nok(212);

my $extract_resolv_conf = $pna->extract_resolv_conf();
length($extract_resolv_conf) eq '149' ? ok(213) : nok(213);
md5_hex($extract_resolv_conf) eq 'a120ae49b448833a603506ae3a60ea12' ? ok(214) : nok(214);
substr($extract_resolv_conf,0,20) eq '===== RESOLV-CONF ==' ? ok(215) : nok(215);

my $extract_route_gsn = $pna->extract_route_gsn();
length($extract_route_gsn) eq '0' ? ok(216) : nok(216);
md5_hex($extract_route_gsn) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(217) : nok(217);
substr($extract_route_gsn,0,20) eq '' ? ok(218) : nok(218);

my $extract_sas_adapter_state = $pna->extract_sas_adapter_state();
length($extract_sas_adapter_state) eq '0' ? ok(219) : nok(219);
md5_hex($extract_sas_adapter_state) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(220) : nok(220);
substr($extract_sas_adapter_state,0,20) eq '' ? ok(221) : nok(221);

my $extract_sas_dev_stats = $pna->extract_sas_dev_stats();
length($extract_sas_dev_stats) eq '0' ? ok(222) : nok(222);
md5_hex($extract_sas_dev_stats) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(223) : nok(223);
substr($extract_sas_dev_stats,0,20) eq '' ? ok(224) : nok(224);

my $extract_sas_expander_map = $pna->extract_sas_expander_map();
length($extract_sas_expander_map) eq '0' ? ok(225) : nok(225);
md5_hex($extract_sas_expander_map) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(226) : nok(226);
substr($extract_sas_expander_map,0,20) eq '' ? ok(227) : nok(227);

my $extract_sas_expander_phy_state = $pna->extract_sas_expander_phy_state();
length($extract_sas_expander_phy_state) eq '0' ? ok(228) : nok(228);
md5_hex($extract_sas_expander_phy_state) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(229) : nok(229);
substr($extract_sas_expander_phy_state,0,20) eq '' ? ok(230) : nok(230);

my $extract_sas_shelf = $pna->extract_sas_shelf();
length($extract_sas_shelf) eq '0' ? ok(231) : nok(231);
md5_hex($extract_sas_shelf) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(232) : nok(232);
substr($extract_sas_shelf,0,20) eq '' ? ok(233) : nok(233);

my $extract_service_usage = $pna->extract_service_usage();
length($extract_service_usage) eq '575' ? ok(234) : nok(234);
md5_hex($extract_service_usage) eq 'ed45c9a1b49e67bd55cbd069f51f5478' ? ok(235) : nok(235);
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
length($extract_snap_list_n) eq '749' ? ok(261) : nok(261);
md5_hex($extract_snap_list_n) eq '042fe7647332e2be886e118f8bbcd385' ? ok(262) : nok(262);
substr($extract_snap_list_n,0,20) eq '===== SNAP-LIST-N ==' ? ok(263) : nok(263);

my $extract_snap_list_n_a = $pna->extract_snap_list_n_a();
length($extract_snap_list_n_a) eq '75' ? ok(264) : nok(264);
md5_hex($extract_snap_list_n_a) eq '6bc8ebbd4560de16e5de879286272d3a' ? ok(265) : nok(265);
substr($extract_snap_list_n_a,0,20) eq '===== SNAP-LIST-N-A ' ? ok(266) : nok(266);

my $extract_snap_reserve = $pna->extract_snap_reserve();
length($extract_snap_reserve) eq '405' ? ok(267) : nok(267);
md5_hex($extract_snap_reserve) eq '585e88f3944ee16eea20bfadbab4d52d' ? ok(268) : nok(268);
substr($extract_snap_reserve,0,20) eq '===== SNAP-RESERVE =' ? ok(269) : nok(269);

my $extract_snap_reserve_a = $pna->extract_snap_reserve_a();
length($extract_snap_reserve_a) eq '90' ? ok(270) : nok(270);
md5_hex($extract_snap_reserve_a) eq '521022588a7fdfb40a90a803599c75f1' ? ok(271) : nok(271);
substr($extract_snap_reserve_a,0,20) eq '===== SNAP-RESERVE-A' ? ok(272) : nok(272);

my $extract_snap_sched = $pna->extract_snap_sched();
length($extract_snap_sched) eq '240' ? ok(273) : nok(273);
md5_hex($extract_snap_sched) eq '8d3776f10105590eae75bdc30ec679da' ? ok(274) : nok(274);
substr($extract_snap_sched,0,20) eq '===== SNAP-SCHED ===' ? ok(275) : nok(275);

my $extract_snap_sched_a = $pna->extract_snap_sched_a();
length($extract_snap_sched_a) eq '57' ? ok(276) : nok(276);
md5_hex($extract_snap_sched_a) eq '9fe76ccd0da46f6ae5037343440ef168' ? ok(277) : nok(277);
substr($extract_snap_sched_a,0,20) eq '===== SNAP-SCHED-A =' ? ok(278) : nok(278);

my $extract_snap_status = $pna->extract_snap_status();
length($extract_snap_status) eq '0' ? ok(279) : nok(279);
md5_hex($extract_snap_status) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(280) : nok(280);
substr($extract_snap_status,0,20) eq '' ? ok(281) : nok(281);

my $extract_snap_status_a = $pna->extract_snap_status_a();
length($extract_snap_status_a) eq '0' ? ok(282) : nok(282);
md5_hex($extract_snap_status_a) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(283) : nok(283);
substr($extract_snap_status_a,0,20) eq '' ? ok(284) : nok(284);

my $extract_snapmirror_destinations = $pna->extract_snapmirror_destinations();
length($extract_snapmirror_destinations) eq '83' ? ok(285) : nok(285);
md5_hex($extract_snapmirror_destinations) eq '5944c21cebf9182b788260bc9153137c' ? ok(286) : nok(286);
substr($extract_snapmirror_destinations,0,20) eq '===== SNAPMIRROR DES' ? ok(287) : nok(287);

my $extract_snapmirror_status = $pna->extract_snapmirror_status();
length($extract_snapmirror_status) eq '50' ? ok(288) : nok(288);
md5_hex($extract_snapmirror_status) eq 'cf37e9fd748aca37fbbcec15ff926eef' ? ok(289) : nok(289);
substr($extract_snapmirror_status,0,20) eq '===== SNAPMIRROR STA' ? ok(290) : nok(290);

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
length($extract_software_licenses) eq '1219' ? ok(306) : nok(306);
md5_hex($extract_software_licenses) eq '6536812ed362cbc100fc11b5f88455d5' ? ok(307) : nok(307);
substr($extract_software_licenses,0,20) eq '===== SOFTWARE LICEN' ? ok(308) : nok(308);

my $extract_ssh = $pna->extract_ssh();
length($extract_ssh) eq '0' ? ok(309) : nok(309);
md5_hex($extract_ssh) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(310) : nok(310);
substr($extract_ssh,0,20) eq '' ? ok(311) : nok(311);

my $extract_storage = $pna->extract_storage();
length($extract_storage) eq '23944' ? ok(312) : nok(312);
md5_hex($extract_storage) eq 'b538cf880a08e96aea75369504e366cc' ? ok(313) : nok(313);
substr($extract_storage,0,20) eq '===== STORAGE =====
' ? ok(314) : nok(314);

my $extract_sysconfig_a = $pna->extract_sysconfig_a();
length($extract_sysconfig_a) eq '8625' ? ok(315) : nok(315);
md5_hex($extract_sysconfig_a) eq '97d1b18c1a9fffaf1f04d8317e49272f' ? ok(316) : nok(316);
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
length($extract_sysconfig_d) eq '1563' ? ok(324) : nok(324);
md5_hex($extract_sysconfig_d) eq 'f349247d0e155ba86583d9770dccd884' ? ok(325) : nok(325);
substr($extract_sysconfig_d,0,20) eq '===== SYSCONFIG-D ==' ? ok(326) : nok(326);

my $extract_sysconfig_hardware_ids = $pna->extract_sysconfig_hardware_ids();
length($extract_sysconfig_hardware_ids) eq '120' ? ok(327) : nok(327);
md5_hex($extract_sysconfig_hardware_ids) eq '51c29c6776d297d1c67e0646225ea152' ? ok(328) : nok(328);
substr($extract_sysconfig_hardware_ids,0,20) eq '===== SYSCONFIG HARD' ? ok(329) : nok(329);

my $extract_sysconfig_m = $pna->extract_sysconfig_m();
length($extract_sysconfig_m) eq '0' ? ok(330) : nok(330);
md5_hex($extract_sysconfig_m) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(331) : nok(331);
substr($extract_sysconfig_m,0,20) eq '' ? ok(332) : nok(332);

my $extract_sysconfig_r = $pna->extract_sysconfig_r();
length($extract_sysconfig_r) eq '3249' ? ok(333) : nok(333);
md5_hex($extract_sysconfig_r) eq '5f3099745d27cdf3a535d6469431a0b2' ? ok(334) : nok(334);
substr($extract_sysconfig_r,0,20) eq '===== SYSCONFIG-R ==' ? ok(335) : nok(335);

my $extract_system_serial_number = $pna->extract_system_serial_number();
length($extract_system_serial_number) eq '65' ? ok(336) : nok(336);
md5_hex($extract_system_serial_number) eq '4dd1909ba23c74b25f8ecf201554fbf7' ? ok(337) : nok(337);
substr($extract_system_serial_number,0,20) eq '===== SYSTEM SERIAL ' ? ok(338) : nok(338);

my $extract_unowned_disks = $pna->extract_unowned_disks();
length($extract_unowned_disks) eq '0' ? ok(339) : nok(339);
md5_hex($extract_unowned_disks) eq 'd41d8cd98f00b204e9800998ecf8427e' ? ok(340) : nok(340);
substr($extract_unowned_disks,0,20) eq '' ? ok(341) : nok(341);

my $extract_usage = $pna->extract_usage();
length($extract_usage) eq '1509' ? ok(342) : nok(342);
md5_hex($extract_usage) eq '604c7ee9f6a24dcdcd953df27609609d' ? ok(343) : nok(343);
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
length($extract_vif_status) eq '887' ? ok(354) : nok(354);
md5_hex($extract_vif_status) eq '3a40a5e769fc92b6a7474fe2864c69b2' ? ok(355) : nok(355);
substr($extract_vif_status,0,20) eq '===== VIF-STATUS ===' ? ok(356) : nok(356);

my $extract_vlan_stat = $pna->extract_vlan_stat();
length($extract_vlan_stat) eq '113' ? ok(357) : nok(357);
md5_hex($extract_vlan_stat) eq '5eaddbb89b9b8ba3cf38cfe6ca70aa1f' ? ok(358) : nok(358);
substr($extract_vlan_stat,0,20) eq '===== VLAN STAT ====' ? ok(359) : nok(359);

my $extract_vol_language = $pna->extract_vol_language();
length($extract_vol_language) eq '269' ? ok(360) : nok(360);
md5_hex($extract_vol_language) eq 'efa4ac45c2bd0fa1bc9dbc480a618946' ? ok(361) : nok(361);
substr($extract_vol_language,0,20) eq '===== VOL-LANGUAGE =' ? ok(362) : nok(362);

my $extract_vol_status = $pna->extract_vol_status();
length($extract_vol_status) eq '6088' ? ok(363) : nok(363);
md5_hex($extract_vol_status) eq '7063ae25bc447538b27a8b8c5ad95b74' ? ok(364) : nok(364);
substr($extract_vol_status,0,20) eq '===== VOL-STATUS ===' ? ok(365) : nok(365);

my $extract_vscan = $pna->extract_vscan();
length($extract_vscan) eq '274' ? ok(366) : nok(366);
md5_hex($extract_vscan) eq '818f8a21bd2fe1d2858a015a5e490013' ? ok(367) : nok(367);
substr($extract_vscan,0,20) eq '===== VSCAN =====

V' ? ok(368) : nok(368);

my $extract_vscan_options = $pna->extract_vscan_options();
length($extract_vscan_options) eq '122' ? ok(369) : nok(369);
md5_hex($extract_vscan_options) eq '8e69a2838773a25cf9a0cbc50a65c2fa' ? ok(370) : nok(370);
substr($extract_vscan_options,0,20) eq '===== VSCAN OPTIONS ' ? ok(371) : nok(371);

my $extract_vscan_scanners = $pna->extract_vscan_scanners();
length($extract_vscan_scanners) eq '60' ? ok(372) : nok(372);
md5_hex($extract_vscan_scanners) eq '9794c533b37cc0ee4fbce706067161ab' ? ok(373) : nok(373);
substr($extract_vscan_scanners,0,20) eq '===== VSCAN SCANNERS' ? ok(374) : nok(374);

my $extract_xheader = $pna->extract_xheader();
length($extract_xheader) eq '609' ? ok(375) : nok(375);
md5_hex($extract_xheader) eq '03a70c60e894d616338987c43473de62' ? ok(376) : nok(376);
substr($extract_xheader,0,20) eq '===== X-HEADER DATA ' ? ok(377) : nok(377);

BEGIN { plan tests => 377 };
