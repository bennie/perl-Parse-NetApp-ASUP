#!/usr/bin/perl -Ilib

use File::Slurp;
use Digest::MD5 qw(md5_hex);
use Parse::NetApp::ASUP;
use strict;

my @methods = qw/extract_acp_list_all extract_aggr_status extract_cf_monitor
extract_cifs_domaininfo extract_cifs_sessions extract_cifs_shares extract_cifs_stat 
extract_cluster_monitor extract_df extract_df_a extract_df_i extract_df_r extract_df_s
extract_dns_info extract_ecc_memory_scrubber_stats extract_environment extract_exports
extract_failed_disk_registry extract_fc_device_map extract_fc_link_stats extract_fc_stats
extract_fcp_cfmode extract_fcp_initiator_status extract_fcp_status extract_fcp_target_adapters
extract_fcp_target_configuration extract_fcp_target_stats extract_flash_card_info
extract_fmm_data extract_fpolicy extract_headers extract_hosts extract_httpstat
extract_hwassist_stats extract_ifconfig_a extract_ifgrp_status extract_ifstat_a
extract_initiator_groups extract_interconnect_config extract_interconnect_stats
extract_iscsi_alias extract_iscsi_connections extract_iscsi_initiator_status
extract_iscsi_interface extract_iscsi_interface_accesslist extract_iscsi_isns
extract_iscsi_nodename extract_iscsi_portals extract_iscsi_security extract_iscsi_sessions
extract_iscsi_statistics extract_iscsi_status extract_iscsi_target_portal_groups
extract_lun_config_check extract_lun_configuration extract_lun_hist extract_lun_statistics
extract_messages extract_nbtstat_c extract_netstat_s extract_nfsstat_cc extract_nfsstat_d
extract_nis_info extract_nsswitch_conf extract_options extract_portsets extract_priority_show
extract_qtree_status extract_quotas extract_rc extract_resolv_conf extract_route_gsn
extract_sas_adapter_state extract_sas_dev_stats extract_sas_expander_map
extract_sas_expander_phy_state extract_sas_shelf extract_service_usage extract_shelf_log_esh
extract_shelf_log_iom extract_sis_stat extract_sis_stat_l extract_sis_status extract_sis_status_l
extract_sm_allow extract_sm_conf extract_snap_list_n extract_snap_list_n_a extract_snap_reserve
extract_snap_reserve_a extract_snap_sched extract_snap_sched_a extract_snap_status
extract_snap_status_a extract_snapmirror_destinations extract_snapmirror_status
extract_snapvault_destinations extract_snapvault_snap_sched extract_snapvault_status_l
extract_snaplock extract_snaplock_clock extract_software_licenses extract_ssh extract_storage
extract_sysconfig_a extract_sysconfig_ac extract_sysconfig_c extract_sysconfig_d
extract_sysconfig_hardware_ids extract_sysconfig_m extract_sysconfig_r extract_system_serial_number
extract_unowned_disks extract_usage extract_usermap_cfg extract_vfiler_startup_times
extract_vfilers extract_vif_status extract_vlan_stat extract_vol_language extract_vol_status
extract_vscan extract_vscan_options extract_vscan_scanners extract_xheader/;

my @asups = `find examples -type f -name asup??.txt`;

for my $asup ( sort @asups ) {
  chomp $asup;
  $asup =~ /examples\/(.+?)\/asup(\d\d).txt/ or die "Bad ASUP found: $asup";
  my $ver = $1; my $num = $2;
  my $outfile = 't/v'.$ver.'-'.$num.'.t';
  print "Building tests for $asup -> $ver $num -> $outfile\n";

  open OUTFILE, '>', $outfile or die $!;
  print OUTFILE "use File::Slurp;\nuse Digest::MD5 qw(md5_hex);\nuse Parse::NetApp::ASUP;\nuse Test;\n\n";
  print OUTFILE "my \$pna = Parse::NetApp::ASUP->new();\nmy \$asup = read_file('$asup');\n\n";
  print OUTFILE "my \$ret = \$pna->load(\$asup);\n\$ret == 1 ? ok(1) : nok(1);\n\n";
  print OUTFILE "my \$ver = \$pna->asup_version(\$asup);\n\$ver eq '$ver' ? ok(2) : nok(2);\n\n";
  
  my $count = 2;
  for my $method (@methods) {
    my $pna = Parse::NetApp::ASUP->new();
    my $file = read_file($asup);
    $pna->load($file);
    
    my $ret = $pna->$method;
    my $chars = length($ret);
    my $sample = substr $ret, 0, 20;
    my $hash = md5_hex($ret);

    print OUTFILE "my \$$method = \$pna->$method();\n";

    $count++;
    print OUTFILE "length(\$$method) eq '$chars' ? ok($count) : nok($count);\n";

    $count++;
    print OUTFILE "md5_hex(\$$method) eq '$hash' ? ok($count) : nok($count);\n";

    $count++;
    $sample =~ s/'/\'/g;
    print OUTFILE "substr(\$$method,0,20) eq '$sample' ? ok($count) : nok($count);\n";

    print OUTFILE "\n";
  }
  
  
  print OUTFILE "BEGIN { plan tests => $count };\n";
  close OUTFILE;
}

###

print "Rebuilding MANIFEST\n";

`cat MANIFEST > /tmp/MANIFEST`;
`find t -type f -name *.t >> /tmp/MANIFEST`;
`cat /tmp/MANIFEST | sort -u > MANIFEST`;
`rm /tmp/MANIFEST`;