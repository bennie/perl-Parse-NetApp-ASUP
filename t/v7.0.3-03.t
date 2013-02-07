use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use Test;

my $pna = Parse::NetApp::ASUP->new();
my $asup = read_file('examples/7.0.3/asup03.txt');

my $ret = $pna->load($asup);
$ret == 1 ? ok(1) : nok(1);

my $ver = $pna->asup_version($asup);
$ver eq '7.0.3' ? ok(2) : nok(2);

my $extract_acp_list_all = $pna->extract_acp_list_all();
ok(3);

my $extract_aggr_status = $pna->extract_aggr_status();
ok(4);

my $extract_cf_monitor = $pna->extract_cf_monitor();
ok(5);

my $extract_cifs_domaininfo = $pna->extract_cifs_domaininfo();
ok(6);

my $extract_cifs_sessions = $pna->extract_cifs_sessions();
ok(7);

my $extract_cifs_shares = $pna->extract_cifs_shares();
ok(8);

my $extract_cifs_stat = $pna->extract_cifs_stat();
ok(9);

my $extract_cluster_monitor = $pna->extract_cluster_monitor();
ok(10);

my $extract_df = $pna->extract_df();
ok(11);

my $extract_df_a = $pna->extract_df_a();
ok(12);

my $extract_df_i = $pna->extract_df_i();
ok(13);

my $extract_df_r = $pna->extract_df_r();
ok(14);

my $extract_df_s = $pna->extract_df_s();
ok(15);

my $extract_dns_info = $pna->extract_dns_info();
ok(16);

my $extract_ecc_memory_scrubber_stats = $pna->extract_ecc_memory_scrubber_stats();
ok(17);

my $extract_environment = $pna->extract_environment();
ok(18);

my $extract_exports = $pna->extract_exports();
ok(19);

my $extract_failed_disk_registry = $pna->extract_failed_disk_registry();
ok(20);

my $extract_fc_device_map = $pna->extract_fc_device_map();
ok(21);

my $extract_fc_link_stats = $pna->extract_fc_link_stats();
ok(22);

my $extract_fc_stats = $pna->extract_fc_stats();
ok(23);

my $extract_fcp_cfmode = $pna->extract_fcp_cfmode();
ok(24);

my $extract_fcp_initiator_status = $pna->extract_fcp_initiator_status();
ok(25);

my $extract_fcp_status = $pna->extract_fcp_status();
ok(26);

my $extract_fcp_target_adapters = $pna->extract_fcp_target_adapters();
ok(27);

my $extract_fcp_target_configuration = $pna->extract_fcp_target_configuration();
ok(28);

my $extract_fcp_target_stats = $pna->extract_fcp_target_stats();
ok(29);

my $extract_flash_card_info = $pna->extract_flash_card_info();
ok(30);

my $extract_fmm_data = $pna->extract_fmm_data();
ok(31);

my $extract_fpolicy = $pna->extract_fpolicy();
ok(32);

my $extract_headers = $pna->extract_headers();
ok(33);

my $extract_hosts = $pna->extract_hosts();
ok(34);

my $extract_httpstat = $pna->extract_httpstat();
ok(35);

my $extract_hwassist_stats = $pna->extract_hwassist_stats();
ok(36);

my $extract_ifconfig_a = $pna->extract_ifconfig_a();
ok(37);

my $extract_ifgrp_status = $pna->extract_ifgrp_status();
ok(38);

my $extract_ifstat_a = $pna->extract_ifstat_a();
ok(39);

my $extract_initiator_groups = $pna->extract_initiator_groups();
ok(40);

my $extract_interconnect_config = $pna->extract_interconnect_config();
ok(41);

my $extract_interconnect_stats = $pna->extract_interconnect_stats();
ok(42);

my $extract_iscsi_alias = $pna->extract_iscsi_alias();
ok(43);

my $extract_iscsi_connections = $pna->extract_iscsi_connections();
ok(44);

my $extract_iscsi_initiator_status = $pna->extract_iscsi_initiator_status();
ok(45);

my $extract_iscsi_interface = $pna->extract_iscsi_interface();
ok(46);

my $extract_iscsi_interface_accesslist = $pna->extract_iscsi_interface_accesslist();
ok(47);

my $extract_iscsi_isns = $pna->extract_iscsi_isns();
ok(48);

my $extract_iscsi_nodename = $pna->extract_iscsi_nodename();
ok(49);

my $extract_iscsi_portals = $pna->extract_iscsi_portals();
ok(50);

my $extract_iscsi_security = $pna->extract_iscsi_security();
ok(51);

my $extract_iscsi_sessions = $pna->extract_iscsi_sessions();
ok(52);

my $extract_iscsi_statistics = $pna->extract_iscsi_statistics();
ok(53);

my $extract_iscsi_status = $pna->extract_iscsi_status();
ok(54);

my $extract_iscsi_target_portal_groups = $pna->extract_iscsi_target_portal_groups();
ok(55);

my $extract_lun_config_check = $pna->extract_lun_config_check();
ok(56);

my $extract_lun_configuration = $pna->extract_lun_configuration();
ok(57);

my $extract_lun_hist = $pna->extract_lun_hist();
ok(58);

my $extract_lun_statistics = $pna->extract_lun_statistics();
ok(59);

my $extract_messages = $pna->extract_messages();
ok(60);

my $extract_nbtstat_c = $pna->extract_nbtstat_c();
ok(61);

my $extract_netstat_s = $pna->extract_netstat_s();
ok(62);

my $extract_nfsstat_cc = $pna->extract_nfsstat_cc();
ok(63);

my $extract_nfsstat_d = $pna->extract_nfsstat_d();
ok(64);

my $extract_nis_info = $pna->extract_nis_info();
ok(65);

my $extract_nsswitch_conf = $pna->extract_nsswitch_conf();
ok(66);

my $extract_options = $pna->extract_options();
ok(67);

my $extract_portsets = $pna->extract_portsets();
ok(68);

my $extract_priority_show = $pna->extract_priority_show();
ok(69);

my $extract_qtree_status = $pna->extract_qtree_status();
ok(70);

my $extract_quotas = $pna->extract_quotas();
ok(71);

my $extract_rc = $pna->extract_rc();
ok(72);

my $extract_resolv_conf = $pna->extract_resolv_conf();
ok(73);

my $extract_route_gsn = $pna->extract_route_gsn();
ok(74);

my $extract_sas_adapter_state = $pna->extract_sas_adapter_state();
ok(75);

my $extract_sas_dev_stats = $pna->extract_sas_dev_stats();
ok(76);

my $extract_sas_expander_map = $pna->extract_sas_expander_map();
ok(77);

my $extract_sas_expander_phy_state = $pna->extract_sas_expander_phy_state();
ok(78);

my $extract_sas_shelf = $pna->extract_sas_shelf();
ok(79);

my $extract_service_usage = $pna->extract_service_usage();
ok(80);

my $extract_shelf_log_esh = $pna->extract_shelf_log_esh();
ok(81);

my $extract_shelf_log_iom = $pna->extract_shelf_log_iom();
ok(82);

my $extract_sis_stat = $pna->extract_sis_stat();
ok(83);

my $extract_sis_stat_l = $pna->extract_sis_stat_l();
ok(84);

my $extract_sis_status = $pna->extract_sis_status();
ok(85);

my $extract_sis_status_l = $pna->extract_sis_status_l();
ok(86);

my $extract_sm_allow = $pna->extract_sm_allow();
ok(87);

my $extract_sm_conf = $pna->extract_sm_conf();
ok(88);

my $extract_snap_list_n = $pna->extract_snap_list_n();
ok(89);

my $extract_snap_list_n_a = $pna->extract_snap_list_n_a();
ok(90);

my $extract_snap_reserve = $pna->extract_snap_reserve();
ok(91);

my $extract_snap_reserve_a = $pna->extract_snap_reserve_a();
ok(92);

my $extract_snap_sched = $pna->extract_snap_sched();
ok(93);

my $extract_snap_sched_a = $pna->extract_snap_sched_a();
ok(94);

my $extract_snap_status = $pna->extract_snap_status();
ok(95);

my $extract_snap_status_a = $pna->extract_snap_status_a();
ok(96);

my $extract_snapmirror_destinations = $pna->extract_snapmirror_destinations();
ok(97);

my $extract_snapmirror_status = $pna->extract_snapmirror_status();
ok(98);

my $extract_snapvault_destinations = $pna->extract_snapvault_destinations();
ok(99);

my $extract_snapvault_snap_sched = $pna->extract_snapvault_snap_sched();
ok(100);

my $extract_snapvault_status_l = $pna->extract_snapvault_status_l();
ok(101);

my $extract_snaplock = $pna->extract_snaplock();
ok(102);

my $extract_snaplock_clock = $pna->extract_snaplock_clock();
ok(103);

my $extract_software_licenses = $pna->extract_software_licenses();
ok(104);

my $extract_ssh = $pna->extract_ssh();
ok(105);

my $extract_storage = $pna->extract_storage();
ok(106);

my $extract_sysconfig_a = $pna->extract_sysconfig_a();
ok(107);

my $extract_sysconfig_ac = $pna->extract_sysconfig_ac();
ok(108);

my $extract_sysconfig_c = $pna->extract_sysconfig_c();
ok(109);

my $extract_sysconfig_d = $pna->extract_sysconfig_d();
ok(110);

my $extract_sysconfig_hardware_ids = $pna->extract_sysconfig_hardware_ids();
ok(111);

my $extract_sysconfig_m = $pna->extract_sysconfig_m();
ok(112);

my $extract_sysconfig_r = $pna->extract_sysconfig_r();
ok(113);

my $extract_system_serial_number = $pna->extract_system_serial_number();
ok(114);

my $extract_unowned_disks = $pna->extract_unowned_disks();
ok(115);

my $extract_usage = $pna->extract_usage();
ok(116);

my $extract_usermap_cfg = $pna->extract_usermap_cfg();
ok(117);

my $extract_vfiler_startup_times = $pna->extract_vfiler_startup_times();
ok(118);

my $extract_vfilers = $pna->extract_vfilers();
ok(119);

my $extract_vif_status = $pna->extract_vif_status();
ok(120);

my $extract_vlan_stat = $pna->extract_vlan_stat();
ok(121);

my $extract_vol_language = $pna->extract_vol_language();
ok(122);

my $extract_vol_status = $pna->extract_vol_status();
ok(123);

my $extract_vscan = $pna->extract_vscan();
ok(124);

my $extract_vscan_options = $pna->extract_vscan_options();
ok(125);

my $extract_vscan_scanners = $pna->extract_vscan_scanners();
ok(126);

my $extract_xheader = $pna->extract_xheader();
ok(127);

BEGIN { plan tests => 127 };
