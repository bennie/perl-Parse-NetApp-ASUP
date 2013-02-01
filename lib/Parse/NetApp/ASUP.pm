$Parse::NetApp::ASUP::VERSION='VERSIONTAG';

=head1 SYNOPSIS:

Parse NetApp Weekly Auto Support Files

=head1 USAGE:

  use Parse::NetApp::ASUP;
  
  my $pna = Parse::NetApp::ASUP->new();
  
  $pna->load($raw_asup_data_as_scalar);
  
=cut 

use Carp;

use strict;
use warnings;

package Parse::NetApp::ASUP;

=head3 new() 

Instance a new parser.

=cut

sub new {
	my $self = {};
	bless $self;
	return $self;
}

=head3 load($raw_asup_data) 

Load a raw asup data file for parsing.

=cut

sub load {
  my $self = shift @_;
  my $asup = shift @_;
  if ( not defined $asup or not length $asup ) {
    warn "load() called without input data.";
    return undef;
  }
  $self->{asup} = $asup;
  return 1;
}

sub version {
	return $Parse::NetApp::ASUP::VERSION;
}

### Utilties

sub _agnostic_line_split { # Now dealing with CRLF and the occasional standalone LF
  my $all = $_[0];
  my @lines = split /\r?\n/, $all;
  return @lines;
}  

sub _regex_lun_name {
  return qr/[\d\w\/\{\}\.-]+/;
}

sub _regex_qtree_name {
  return qr/[\w\-\? ]+/;
}

sub _regex_vol_name {
  return qr/[\w\-\?]+/;
}

sub _regex_path {
  return qr/[\w\-\?\$\\]+/;
}

### Sectional extract methods

=head1 EXTRACT METHODS:

=head3 extract_acp_list_all()

=cut

sub extract_acp_list_all {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ACP LIST ALL =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_aggr_status()

=cut

sub extract_aggr_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0]; 
	return '' unless $raw =~ /(===== AGGR-STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_cf_monitor()

=cut

sub extract_cf_monitor {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== CF MONITOR =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_cifs_domaininfo()

=cut

sub extract_cifs_domaininfo {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== CIFS DOMAININFO =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_cifs_sessions()

=cut

sub extract_cifs_sessions {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== CIFS SESSIONS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_cifs_shares()

=cut

sub extract_cifs_shares {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== CIFS SHARES =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_cifs_stat()

=cut

sub extract_cifs_stat {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== CIFS STAT =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_cluster_monitor()

=cut

sub extract_cluster_monitor {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== CLUSTER MONITOR =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_df()

=cut

sub extract_df {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== DF =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_df_a()

=cut

sub extract_df_a {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== DF-A =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_df_i()

=cut

sub extract_df_i {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== DF-I =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_df_r()

=cut

sub extract_df_r {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== DF-R =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_df_s()

=cut

sub extract_df_s {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== DF-S =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_dns_info()

=cut

sub extract_dns_info {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== DNS info =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_ecc_memory_scrubber_stats()

=cut

sub extract_ecc_memory_scrubber_stats {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ECC MEMORY SCRUBBER STATS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_environment()

=cut

sub extract_environment {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ENVIRONMENT =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_exports()

=cut

sub extract_exports {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	
	# v7
	
	if ( $raw =~ /(===== EXPORTS =====.*?)=====/s ) {
		my $trim = $1;
		while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
		return $trim;
	}
	
	# v8

	my @lines = Parse::NetApp::ASUP::_agnostic_line_split($raw);
	my @trim;
		
	while ( @lines ) {
		my $line = shift @lines;
		if ( $line =~ /^\/vol\/\S+\s+-sec=/ ) {
			@trim = ( $line );
			while ( $lines[0] =~ /^\/vol\/\S+\s+-sec=/ ) {
				push @trim, shift @lines;
			}
		}
	}
	
	return join("\n",@trim) . "\n" if scalar(@trim);

	# give up
	return undef;


}

=head3 extract_failed_disk_registry()

=cut

sub extract_failed_disk_registry {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FAILED_DISK_REGISTRY =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fc_device_map()

=cut

sub extract_fc_device_map {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FC DEVICE MAP =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fc_link_stats()

=cut

sub extract_fc_link_stats {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FC LINK STATS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fc_stats()

=cut

sub extract_fc_stats {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FC STATS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fcp_cfmode()

=cut

sub extract_fcp_cfmode {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FCP CFMODE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fcp_initiator_status()

=cut

sub extract_fcp_initiator_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FCP INITIATOR STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fcp_status()

=cut

sub extract_fcp_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FCP STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fcp_target_adapters()

=cut

sub extract_fcp_target_adapters {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FCP TARGET ADAPTERS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fcp_target_configuration()

=cut

sub extract_fcp_target_configuration {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FCP TARGET CONFIGURATION =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fcp_target_stats()

=cut

sub extract_fcp_target_stats {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FCP TARGET STATS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_flash_card_info()

=cut

sub extract_flash_card_info {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FLASH CARD INFO =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fmm_data()

=cut

sub extract_fmm_data {
	# Space at end to handle lots of equal signs in the content.
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FMM-DATA =====.*?)===== /s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_fpolicy()

=cut

sub extract_fpolicy {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== FPOLICY =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_headers()

=cut

sub extract_headers {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(GENERATED_ON=.*?\n)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_hosts()

=cut

sub extract_hosts {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== HOSTS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_httpstat()

=cut

sub extract_httpstat {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== HTTPSTAT =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_hwassist_stats()

=cut

sub extract_hwassist_stats {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== HWASSIST_STATS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_ifconfig_a()

=cut

sub extract_ifconfig_a {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== IFCONFIG-A =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_ifgrp_status()

=cut

sub extract_ifgrp_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== IFGRP-STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_ifstat_a()

=cut

sub extract_ifstat_a {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== IFSTAT-A =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_initiator_groups()

=cut

sub extract_initiator_groups {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== INITIATOR GROUPS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_interconnect_config()

=cut

sub extract_interconnect_config {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== INTERCONNECT CONFIG =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_interconnect_stats()

=cut

sub extract_interconnect_stats {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== INTERCONNECT STATS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_alias()

=cut

sub extract_iscsi_alias {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI ALIAS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_connections()

=cut

sub extract_iscsi_connections {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI CONNECTIONS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_initiator_status()

=cut

sub extract_iscsi_initiator_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI INITIATOR STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_interface()

=cut

sub extract_iscsi_interface {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI INTERFACE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_interface_accesslist()

=cut

sub extract_iscsi_interface_accesslist {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI INTERFACE ACCESSLIST =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_isns()

=cut

sub extract_iscsi_isns {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI ISNS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_nodename()

=cut

sub extract_iscsi_nodename {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI NODENAME =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_portals()

=cut

sub extract_iscsi_portals {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI PORTALS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_security()

=cut

sub extract_iscsi_security {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI SECURITY =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_sessions()

=cut

sub extract_iscsi_sessions {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI SESSIONS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_statistics()

=cut

sub extract_iscsi_statistics {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI STATISTICS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_status()

=cut

sub extract_iscsi_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_iscsi_target_portal_groups()

=cut

sub extract_iscsi_target_portal_groups {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ISCSI TARGET PORTAL GROUPS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_lun_config_check()

=cut

sub extract_lun_config_check {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== LUN CONFIG CHECK =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_lun_configuration()

=cut

sub extract_lun_configuration {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	
	# v7
	
	if ( $raw =~ /(===== LUN CONFIGURATION =====.*?)=====/s ) {
		my $trim = $1;
		while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
		return $trim;
	}
	
	#v8
	
	my @lines = Parse::NetApp::ASUP::_agnostic_line_split($raw);
	my @trim;
	
	my $regex_lun_name = Parse::NetApp::ASUP::_regex_lun_name();
	
	while ( @lines ) {
		while ( $lines[0] =~ /^(\s{7,8}|\t)($regex_lun_name) +(.*?) +\((\d+)\).*\((.+)\)$/ ) {
			push @trim, shift @lines;
			push @trim, shift @lines if $lines[0] =~ /^\w/; # handle word-wrap on summary line
			while ( $lines[0] =~ /^(\s{7,8}|\t)\s+.+: .+$/ ) {
				push @trim, shift @lines;
			}
		}
		shift @lines;
	}
	
	return join("\n",@trim) . "\n" if scalar(@trim);	

	# give up
	return undef;
}

=head3 extract_lun_hist()

=cut

sub extract_lun_hist {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== LUN HIST =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_lun_statistics()

=cut

sub extract_lun_statistics {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== LUN STATISTICS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_messages()

=cut

sub extract_messages {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];

	my $trim;

	if ( $raw =~ /(===== MESSAGES =====.*?)(=====|\n\n)/s ) { # Often the last item
		$trim = $1;
	}
	
	if ( not $trim and $raw =~ /((^[MTWFS][ouehra][neduit] [JFMASOND]\w\w \d\d? \d\d:\d\d:\d\d [A-Z]{1,4}([\+\-]\d+)? (\[[^\]]+]: .+?|last message repeated \d+ times.+?)\n\n?)+)/ms ) { # v8 is unlabelled
		$trim = "===== MESSAGES =====\n" . $1;
	}

	return undef unless $trim;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;	
}

=head3 extract_nbtstat_c()

=cut

sub extract_nbtstat_c {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== NBTSTAT-C =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_netstat_s()

=cut

sub extract_netstat_s {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== NETSTAT-S =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_nfsstat_cc()

=cut

sub extract_nfsstat_cc {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== NFSSTAT-CC =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_nfsstat_d()

=cut

sub extract_nfsstat_d {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== NFSSTAT-D =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_nis_info()

=cut

sub extract_nis_info {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== NIS info =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_nsswitch_conf()

=cut

sub extract_nsswitch_conf {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== NSSWITCH-CONF =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_options()

=cut

sub extract_options {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== OPTIONS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_portsets()

=cut

sub extract_portsets {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== PORTSETS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_priority_show()

=cut

sub extract_priority_show {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== PRIORITY_SHOW =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_qtree_status()

=cut

sub extract_qtree_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];

	# v7

	if ( $raw =~ /(===== QTREE-STATUS =====.*?)=====/s ) {
		my $trim = $1;
		while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
		return $trim;
   	}

	# v8

	my @lines = Parse::NetApp::ASUP::_agnostic_line_split($raw);
	my @trim;
	
	my $word = Parse::NetApp::ASUP::_regex_path();
	
	while ( @lines ) {
		my $line = shift @lines;
		if ( $line =~ /^Volume\s+Tree\s+Style\s+Oplocks\s+Status\s+ID/ ) {
			@trim = ( $line, shift @lines ); # grab the "---" line too
			while ( $lines[0] =~ /^(${word}\s+){4,6}\d/ ) {
				push @trim, shift @lines;
			}
		}
	}
	
	return join("\n",@trim) . "\n" if scalar(@trim);

	# give up
	return undef;
}

=head3 extract_quotas()

=cut

sub extract_quotas {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== QUOTAS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_rc()

=cut

sub extract_rc {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== RC =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_resolv_conf()

=cut

sub extract_resolv_conf {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== RESOLV-CONF =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_route_gsn()

=cut

sub extract_route_gsn {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== ROUTE-GSN=====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sas_adapter_state()

=cut

sub extract_sas_adapter_state {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SAS ADAPTER STATE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sas_dev_stats()

=cut

sub extract_sas_dev_stats {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SAS DEV STATS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sas_expander_map()

=cut

sub extract_sas_expander_map {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SAS EXPANDER MAP =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sas_expander_phy_state()

=cut

sub extract_sas_expander_phy_state {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SAS EXPANDER PHY STATE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sas_shelf()

=cut

sub extract_sas_shelf {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SAS SHELF =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_service_usage()

=cut

sub extract_service_usage {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SERVICE USAGE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_shelf_log_esh()

=cut

sub extract_shelf_log_esh {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SHELF-LOG-ESH =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_shelf_log_iom()

=cut

sub extract_shelf_log_iom {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SHELF-LOG-IOM =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sis_stat()

=cut

sub extract_sis_stat {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SIS STAT =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sis_stat_l()

=cut

sub extract_sis_stat_l {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SIS STAT L =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sis_status()

=cut

sub extract_sis_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SIS STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sis_status_l()

=cut

sub extract_sis_status_l {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SIS STATUS L =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sm_allow()

=cut

sub extract_sm_allow {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SM-ALLOW =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sm_conf()

=cut

sub extract_sm_conf {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SM-CONF =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snap_list_n()

=cut

sub extract_snap_list_n {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAP-LIST-N =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snap_list_n_a()

=cut

sub extract_snap_list_n_a {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAP-LIST-N-A =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snap_reserve()

=cut

sub extract_snap_reserve {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAP-RESERVE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snap_reserve_a()

=cut

sub extract_snap_reserve_a {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAP-RESERVE-A =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snap_sched()

=cut

sub extract_snap_sched {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAP-SCHED =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snap_sched_a()

=cut

sub extract_snap_sched_a {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAP-SCHED-A =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snap_status()

=cut

sub extract_snap_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAP-STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snap_status_a()

=cut

sub extract_snap_status_a {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAP-STATUS-A =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snapmirror_destinations()

=cut

sub extract_snapmirror_destinations {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAPMIRROR DESTINATIONS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snapmirror_status()

=cut

sub extract_snapmirror_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAPMIRROR STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snapvault_destinations()

=cut

sub extract_snapvault_destinations {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAPVAULT DESTINATIONS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snapvault_snap_sched()

=cut

sub extract_snapvault_snap_sched {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAPVAULT SNAP SCHED =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snapvault_status_l()

=cut

sub extract_snapvault_status_l {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAPVAULT STATUS L =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snaplock()

=cut

sub extract_snaplock {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAPLOCK =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_snaplock_clock()

=cut

sub extract_snaplock_clock {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SNAPLOCK-CLOCK =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_software_licenses()

=cut

sub extract_software_licenses {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SOFTWARE LICENSES =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_ssh()

=cut

sub extract_ssh {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SSH =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_storage()

=cut

sub extract_storage {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== STORAGE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sysconfig_a()

=cut

sub extract_sysconfig_a {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SYSCONFIG-A =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sysconfig_ac()

=cut

sub extract_sysconfig_ac {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SYSCONFIG-AC =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sysconfig_c()

=cut

sub extract_sysconfig_c {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SYSCONFIG-C =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sysconfig_d()

=cut

sub extract_sysconfig_d {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SYSCONFIG-D =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sysconfig_hardware_ids()

=cut

sub extract_sysconfig_hardware_ids {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SYSCONFIG HARDWARE IDS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sysconfig_m()

=cut

sub extract_sysconfig_m {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SYSCONFIG-M =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_sysconfig_r()

=cut

sub extract_sysconfig_r {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SYSCONFIG-R =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_system_serial_number()

=cut

sub extract_system_serial_number {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== SYSTEM SERIAL NUMBER =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_unowned_disks()

=cut

sub extract_unowned_disks {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== UNOWNED-DISKS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_usage()

=cut

sub extract_usage {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== USAGE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_usermap_cfg()

=cut

sub extract_usermap_cfg {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== USERMAP-CFG =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vfiler_startup_times()

=cut

sub extract_vfiler_startup_times {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VFILER STARTUP TIMES =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vfilers()

=cut

sub extract_vfilers {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VFILERS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vif_status()

=cut

sub extract_vif_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VIF-STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vlan_stat()

=cut

sub extract_vlan_stat {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VLAN STAT =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vol_language()

=cut

sub extract_vol_language {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VOL-LANGUAGE =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vol_status()

=cut

sub extract_vol_status {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VOL-STATUS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vscan()

=cut

sub extract_vscan {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VSCAN =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vscan_options()

=cut

sub extract_vscan_options {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VSCAN OPTIONS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_vscan_scanners()

=cut

sub extract_vscan_scanners {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return '' unless $raw =~ /(===== VSCAN SCANNERS =====.*?)=====/s;
	my $trim = $1;
	while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
	return $trim;
}

=head3 extract_xheader()

=cut

sub extract_xheader {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	
	# v7
	if ( $raw =~ /(===== X-HEADER DATA =====.*?)(=====|\n\n)/s ) {
		my $trim = $1;
		while ( $trim !~ /\n\n$/s ) { $trim .= "\n"; }
		return $trim;
	}

	# v8

	my @lines = Parse::NetApp::ASUP::_agnostic_line_split($raw);
	my @trim;
	
	while ( @lines and $lines[0] !~ /^GENERATED_ON/ ) {
		shift @lines; # Skip the mail header, to avoid confusion
	}
	while ( @lines ) {
		my $line = shift @lines;
		push @trim, $line if $line =~ /^X-Netapp-asup-/;
	}
	
	return join("\n",@trim) . "\n" if scalar(@trim);

	# give up
	return undef;
}

### Version 8 and higher extract has to be iterative

sub iterative_extract {
  my $raw = shift @_;  
  my %ex = ( xml => [] );
 
  ($ex{mailheader},$ex{header},$raw) = split /\n\n+/, $raw, 3;

  # Now dealing with CRLF and the occasional standalone LF
  
  my @lines = Parse::NetApp::ASUP::_agnostic_line_split($raw);

  # sysconfig -a
  
  while ( $lines[0] =~ /^(\t|\s{5})/ ) {
    $ex{sysconfig_a} .= (shift @lines) . "\n";
  }

  # sysconfig -d 

  $ex{sysconfig_d} .= (shift @lines) . "\n" if ( $lines[0] =~ /^Device/ );
  $ex{sysconfig_d} .= (shift @lines) . "\n" if ( $lines[0] =~ /^------/ );
  while ( $lines[0] =~ /^[0-9a-f]{2}\.[0-9a-f]{2}/ ) {
    $ex{sysconfig_d} .= (shift @lines) . "\n";
  }
  
  # sn

  $ex{serialnum} = (shift @lines) . "\n" if $lines[0] =~ /^system serial number/;
   
  # options

  while ( $lines[0] =~ /^[a-z_\-0-9]+(\.[a-z_\-0-9]+)+\s+/i ) {
    $ex{options} .= (shift @lines) . "\n";
  }

  # service usage
  
  while ( $lines[0] =~ /^Service statistics as of/ ) {
    $ex{service_usage} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^ \S+\s+\(\S+\).+recorded/ ) {
      $ex{service_usage} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^\s+[A-Z](\s+\d+,){3}/ ) {
        $ex{service_usage} .= (shift @lines)."\n";
      }
    }
  }

  # ifconfig -a
  
  while ( $lines[0] =~ /^[a-zA-Z0-9\-]+: flags/ ) {
    $ex{ifconfig_a} .= (shift @lines) . "\n";
    while ( $lines[0] =~ /^(\t|\s{3})/ ) {
      $ex{ifconfig_a} .= (shift @lines) . "\n";
    }
  }
    
  # ifstat -a
 
  shift @lines if $lines[0] =~ /^$/; # Remove a blank line
  
  while ( $lines[0] =~ /^-- interface/ ) {
    $ex{ifstat_a} .= (shift @lines)."\n";
    $ex{ifstat_a} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
    while ( $lines[0] =~ /^[A-Z_]+\w/ ) {
      $ex{ifstat_a} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^ [A-Z]/i ) {
        $ex{ifstat_a} .= (shift @lines)."\n";      
      }
    }
    while ( $lines[0] =~ /^$/ ) { $ex{ifstat_a} .= (shift @lines)."\n"; }
  }
  
  # cifs_stat
  
  while ( $lines[0] =~ /^\s+(\S+\s+)+\d+(\s+\d+\%)?$/ ) {
    $ex{cifs_stat} .= (shift @lines)."\n";      
  }
  while ( $lines[0] =~ /^(Max|Local|RPC)/ ) {
    $ex{cifs_stat} .= (shift @lines)."\n";      
  }
  
  # Volume-language

  while ( $lines[0] =~ /^\s+Volume Language$/ ) {
    $ex{volume_language} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^(\s+)?\S+( \S+){1,2} \(.+\)$/ ) {
      $ex{volume_language} .= (shift @lines)."\n";
    }
  }

  # httpstat
  
  while ( $lines[0] =~ /^            Requests$/ ) {
    $ex{httpstat} .= (shift @lines)."\n";
    $ex{httpstat} .= (shift @lines) . "\n" if ( $lines[0] =~ /^\s+Accept\s+Reuse\s+Response\s+InBytes\s+OutBytes$/ );
    $ex{httpstat} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
    while ( $lines[0] =~ /^\S+ Stats:$/ ) {
      $ex{httpstat} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^(\s+\d+)+$/ ) {
        $ex{httpstat} .= (shift @lines)."\n";
        $ex{httpstat} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
      }
    }
  }

  # df

  while ( $lines[0] =~ /^Filesystem\s+kbytes/ ) {
    $ex{df} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^(\/vol|snap reserve)/ ) {
      $ex{df} .= (shift @lines)."\n";
    }
  }

  # df_i

  while ( $lines[0] =~ /^Filesystem\s+iused/ ) {
    $ex{df_i} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^\/vol/ ) {
      $ex{df_i} .= (shift @lines)."\n";
    }
  }
  
  # snap-sched

  while ( $lines[0] =~ /^Volume \S+: \d+/ ) {
    $ex{snapsched} .= (shift @lines)."\n";
  }

  # vol-status

  while ( $lines[0] =~ /^\s+Volume\s+State\s+Status\s+Options/ ) {
    $ex{vol_status} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^(\s+)?\S+\s+(online|offline|restricted)\s+\S+/ ) {
      $ex{vol_status} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^\s{14}\s+\S+/ ) {
        $ex{vol_status} .= (shift @lines)."\n";
      }
    }
  }

  # sysconfig_r

  while ( $lines[0] =~ /^(Volume|Aggregate) \S+ \(.+?\) \(.+?\)$/ ) {
    $ex{sysconfig_r} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^  Plex \S+ \(.+?\)$/ ) {
      $ex{sysconfig_r} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^    RAID group \S+ \(.+?\)$/ ) {
        $ex{sysconfig_r} .= (shift @lines)."\n";
        $ex{sysconfig_r} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
        $ex{sysconfig_r} .= (shift @lines)."\n" if $lines[0] =~ /^      RAID Disk/;
        $ex{sysconfig_r} .= (shift @lines)."\n" if $lines[0] =~ /^      ---------/;
        while ( $lines[0] =~ /^(\s+\S+){3}(\s+\d+){2}(\s+\S+\s+(\d+|\-)){2}(\s+\d+\/\d+){2}(\s+)?$/ ) {
          $ex{sysconfig_r} .= (shift @lines)."\n";
        }
        while ( $lines[0] =~ /^$/ ) {
          $ex{sysconfig_r} .= (shift @lines)."\n";
        }
        while ( $lines[0] =~ /(spare|broken|partner) disks/i ) {
          $ex{sysconfig_r} .= (shift @lines)."\n";
          $ex{sysconfig_r} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
          $ex{sysconfig_r} .= (shift @lines)."\n" if $lines[0] =~ /^RAID Disk/;
          $ex{sysconfig_r} .= (shift @lines)."\n" if $lines[0] =~ /^---------/;
          while ( $lines[0] =~ /^(spare|failed|partner)/i ) {
            $ex{sysconfig_r} .= (shift @lines)."\n";
          }
          $ex{sysconfig_r} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
        }
      }
    }
  }

  # fc stats

  while ( $lines[0] =~ /^\S+ driver statistics for slot/ ) {
    $ex{fc_stats} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^ \S+\s+\d+$/ ) {
      $ex{fc_stats} .= (shift @lines)."\n";      
    }
    $ex{fc_stats} .= (shift @lines)."\n" if $lines[0] =~ /^ device status:\s+/;
    while ( $lines[0] =~ /^  \S+\s+.*total:\s+\d+$/ ) {
      $ex{fc_stats} .= (shift @lines)."\n";      
    }
  }
  while ( $lines[0] =~ /^Cannot complete operation on channel \S+; link is DOWN/ ) {
    $ex{fc_stats} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^$/ ) { $ex{fc_stats} .= (shift @lines)."\n" }
  }
  
  # FC device map

  while ( $lines[0] =~ /^Loop Map for channel/ ) {
    $ex{fc_dev_map} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^(Translated Map|Shelf mapping|(Target SES devices|Initiators) on this loop):/ ) {
      $ex{fc_dev_map} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^$/ ) { $ex{fc_dev_map} .= (shift @lines)."\n" }
      while ( $lines[0] =~ /^\s+(Shelf (\d+|Unknown):\s+)?((\d+|XXX)\s+)+/ ) {
        $ex{fc_dev_map} .= (shift @lines)."\n";
      }
      while ( $lines[0] =~ /^$/ ) { $ex{fc_dev_map} .= (shift @lines)."\n" }
    }
    while ( $lines[0] =~ /^$/ ) { $ex{fc_dev_map} .= (shift @lines)."\n" }
    while ( $lines[0] =~ /^Cannot complete operation on channel \S+; link is DOWN/ ) {
      $ex{fc_dev_map} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^$/ ) { $ex{fc_dev_map} .= (shift @lines)."\n" }
    }
  }

  # FC link stats
  
  while ( $lines[0] =~ /Loop\s+Link\s+Transport\s+Loss of\s+Invalid\s+Frame In\s+Frame Out/ ) {
    $ex{fc_link_stats} .= (shift @lines)."\n".(shift @lines)."\n".(shift @lines)."\n";
    while ( $lines[0] =~ /^\w+\.\w+(\s+\d+){6}$/ ) {
      $ex{fc_link_stats} .= (shift @lines)."\n";
    }
    while ( $lines[0] =~ /^$/ ) { $ex{fc_link_stats} .= (shift @lines)."\n" }
    while ( $lines[0] =~ /^Cannot complete operation on channel \S+; link is DOWN/ ) {
      $ex{fc_link_stats} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^$/ ) { $ex{fc_link_stats} .= (shift @lines)."\n" }
    }
  }
  
  # Registry
  
  while ( $lines[0] =~ /^Loaded=/ ) {
    for ( 1 .. 15 ) { $ex{registry} .= (shift @lines)."\n"; }
  }
  
  # Usage
  
  while ( $lines[0] =~ /^[\w\-]+(\.[\w\-]+)+=\d+$/ ) {
    $ex{usage} .= (shift @lines)."\n";
  }

  # ACP list all
  
  $ex{acp_list_all} .= (shift @lines)."\n" if $lines[0] =~ /^\[acpadmin list.all\]/;
  $ex{acp_list_all} .= (shift @lines)."\n" if length($ex{acp_list_all}) and $lines[0] =~ /^$/;
  
  # DNS info? - should be IP?

  $ex{dns_info} .= (shift @lines)."\n" if $lines[0] =~ /^IP\s+MAC/;
  $ex{dns_info} .= (shift @lines)."\n" if $lines[0] =~ /^Address\s+Address/;
  $ex{dns_info} .= (shift @lines)."\n" if $lines[0] =~ /^\-+$/;
  while ( $lines[0] =~ /^\d{1,3}(\.\d{1,3}){3}/ ) {
    $ex{dns_info} .= (shift @lines)."\n";
  } 
  
  # media_scrub

  while ( $lines[0] =~ /^\S+ media_scrub: status/ ) {
    $ex{media_scrub} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^\t\S/ ) {
      $ex{media_scrub} .= (shift @lines)."\n";
    }
    $ex{media_scrub} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
  }
  
  # scrub
  
  while ( $lines[0] =~ /^\S+ scrub/ ) {
    $ex{scrub} .= (shift @lines)."\n";
  }

  # UNKNOWN
  
  while ( $lines[0] =~ /^(Aggregate|Volume) \S+ \(.+?\) \(.+?\)$/ ) {
    $ex{UNKNOWN} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^  Plex \S+ \(.+?\)$/ ) {
      $ex{UNKNOWN} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^    RAID group \S+ \(.+?\)$/ ) {
        $ex{UNKNOWN} .= (shift @lines)."\n";
        $ex{UNKNOWN} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
        $ex{UNKNOWN} .= (shift @lines)."\n" if $lines[0] =~ /^      RAID Disk/;
        $ex{UNKNOWN} .= (shift @lines)."\n" if $lines[0] =~ /^      ---------/;
        while ( $lines[0] =~ /^      (dparity|data|parity)/ ) {
          $ex{UNKNOWN} .= (shift @lines)."\n";
        }
        while ( $lines[0] =~ /^$/ ) {
          $ex{UNKNOWN} .= (shift @lines)."\n";
        }
      }
    }
  }

  # aggr_status
  
  while ( $lines[0] =~ /^\s+Aggr\s+State\s+Status\s+Options/ ) {
    $ex{aggr_status} .= (shift @lines)."\n";
    while ( $lines[0] =~ /^(\s+)?\S+\s+(online|offline|restricted)\s+\S+/ ) {
      $ex{aggr_status} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^\s{14}\s+\S+/ ) {
        $ex{aggr_status} .= (shift @lines)."\n";
      }
    }
    $ex{aggr_status} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
    while ( $lines[0] =~ /^\s+Volumes: \S/ ) {
      $ex{aggr_status} .= (shift @lines)."\n";
      while ( $lines[0] =~ /^\s{8}\s+\S/ ) {
        $ex{aggr_status} .= (shift @lines)."\n";
      }
      $ex{aggr_status} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
      while ( $lines[0] =~ /^\s+Plex \S+: \S/ ) {
        $ex{aggr_status} .= (shift @lines)."\n";
        while ( $lines[0] =~ /^\s+RAID group \S+: \S/ ) {
          $ex{aggr_status} .= (shift @lines)."\n";
        }
      }
      $ex{aggr_status} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
      while ( $lines[0] =~ /^\s*\S+\s+(online|offline|restricted)(\s+\S+){2}/ ) {
        $ex{aggr_status} .= (shift @lines)."\n";
        while ( $lines[0] =~ /^\s{19}\s+\S+/ ) {
          $ex{aggr_status} .= (shift @lines)."\n";
        }
      }
      $ex{aggr_status} .= (shift @lines)."\n" if $lines[0] =~ /^$/;
    }
  }

  # xml

  while (  scalar(@lines) and $lines[0] =~ /<\?xml version="1.0"\?>/ ) {
    my $xml = (shift @lines)."\n";
    while ( scalar(@lines) and $lines[0] !~ /<\?xml version="1.0"\?>/ ) {
      $xml .= (shift @lines)."\n";
    }
    push @{$ex{xml}}, $xml;
  }

  $ex{_REMAINDER} = \@lines;
  
  return \%ex;
}

### Parse methods

sub parse_df {
	my %vols = ();
	return ( wantarray ? %vols : \%vols ) unless defined $_[0];

	my @df = split "\n", $_[0];
	shift @df if $df[0] =~ /^===== DF =====$/;
	shift @df if $df[0] =~ /^Filesystem.*kbytes.*used.*avail.*capacity.*Mounted on/; # Drop the header row

	while ( scalar(@df) ) {
		my $line = shift @df;
		$line .= shift @df if defined $df[0] and $df[0] =~ /^[\w\d\/\.]+$/;          # Wraparound on mount point

		Carp::croak "BAD DF LINE: '$line'\n"
			unless $line =~ /^([\w\d\/\.]+).+?(\d+).+?(\d+).+?(\d+).+?([-\d]+\%).+?([\w\d\/\.]+)$/;

		my ( $volume, $kbytes, $used, $avail, $capacity, $mounted_on ) = ( $1, $2, $3, $4, $5, $6 );
		next if $volume =~ /.snapshot$/;

		my $volname_clean = $volume;
		$volname_clean =~ s/^\/vol\///i;
		$volname_clean =~ s/\/$//;

		next if $volume =~ /^snap$/;

		$vols{$volname_clean}{kbytes}     = $kbytes;
		$vols{$volname_clean}{used}       = $used;
		$vols{$volname_clean}{avail}      = $avail;
		$vols{$volname_clean}{capacity}   = $capacity;
		$vols{$volname_clean}{mounted_on} = $mounted_on;
	}

	return wantarray ? %vols : \%vols;
}

sub parse_export {
	my %export = ();
	return ( wantarray ? %export : \%export ) unless defined $_[0];
	my @lines = split "\n", $_[0];
	for my $line (@lines) {
		next if $line =~ /^#/;
		next if $line =~ /^\s*$/;
		if ( $line =~ /^(\S+)\s+(\S+)$/ ) {
			$export{$1} = $2;
		}
	}
	return wantarray ? %export : \%export;
}

sub parse_header {
	my %header = ();
	return ( wantarray ? %header : \%header ) unless defined $_[0];

	my @lines = split "\n", $_[0];
	for my $line (@lines) {
		next if $line =~ /^\s*$/;
		if ( $line =~ /Console is using (.+)$/ ) {
			$header{'console_charset'} = $1;
		} elsif ( $line =~ /^(\w+)=(.*)$/ ) {
			$header{$1} = $2;
		} elsif ( $line =~ /Console encoding is nfs but/ ) {
			chomp $line;
			$header{warnings} = $line;
		} else {
			Carp::croak "Bad header line: [$line]";
		}
	}

	$header{short_version} = $1 if $header{VERSION} =~ /NetApp Release ([\w\.\d]+)/;
	$header{short_version} = $header{VERSION} unless defined $header{short_version};

	return wantarray ? %header : \%header;
}

sub parse_lun {
	my %luns = ();
	return ( wantarray ? %luns : \%luns ) unless length $_[0]; # Return empty if no data given

	my @lun_conf = split "\n", $_[0];

	shift @lun_conf while $lun_conf[0] =~ /^\s*$/;
	shift @lun_conf if defined $lun_conf[0] and $lun_conf[0] eq '===== LUN CONFIGURATION ====='; # remove the first line

	my $regex_lun_name = Parse::NetApp::ASUP::_regex_lun_name();

	while ( scalar(@lun_conf) ) {
		my $line = shift @lun_conf;
		next if $line =~ /^\s*$/;
		
		Carp::croak "Bad LUN Conf Line: [$line]" unless $line =~ /^(\s{7,8}|\t)(\/.+)$/;

		my $rawluninfo = $2;

		$rawluninfo .= ' ' . shift @lun_conf if $lun_conf[0] =~ /^\w/; # handle possible line wrap
		$rawluninfo =~ /^($regex_lun_name) +(.*?) +\((\d+)\).*\((.+)\)$/
			or Carp::croak "CAN'T PARSE LUN SUMMARY LINE: [$rawluninfo]";

		my $lun = $1;

		$luns{$lun}{_size}     = $2;
		$luns{$lun}{_raw_size} = $3;
		$luns{$lun}{_status}   = $4;

		$luns{$lun}{_size} =~ s/g$//;
		$luns{$lun}{_size} = ( $1 * 1024 ) if $luns{$lun}{_size} =~ /(.*)t$/;

		while ( defined $lun_conf[0] and $lun_conf[0] =~ /^(\s{15,16}|\t{2})(\w.+): (.+)$/ ) {
			my $name = $2; my $data = $3;
			shift @lun_conf;

			$data .= ' ' . shift @lun_conf
				if defined $lun_conf[0] and $lun_conf[0] =~ /^\w/; # handle possible line wrap

			$luns{$lun}{$name} = $data;
		}
	}
	return wantarray ? %luns : \%luns;
}

sub parse_qtree {
	my %qtree = ();
	return ( wantarray ? %qtree : \%qtree ) unless defined $_[0];

	my @lines = split "\n", $_[0];
	shift @lines if $lines[0] eq '===== QTREE-STATUS =====';

	my $reg_path = Parse::NetApp::ASUP::_regex_path();
	my $reg_qtree_name = Parse::NetApp::ASUP::_regex_qtree_name();
	my $reg_vol_name = Parse::NetApp::ASUP::_regex_vol_name();

	for my $line (@lines) {
		next if $line =~ /^[\s-]*$/;                                 # Blank and line rows.
		next if $line =~ /Volume.*Tree.*Style.*Oplocks.*Status.*ID/; # header row

		my ( $vol, $tree, $style, $oplocks, $status, $id, $vfiler );
		if ( $line =~ /^($reg_vol_name)\s+($reg_qtree_name)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\d+)\s+(\w+)$/ ) { # v8 with vfiler
			( $vol, $tree, $style, $oplocks, $status, $id, $vfiler ) = ( $1, $2, $3, $4, $5, $6, $7 );
		} elsif ( $line =~ /^($reg_vol_name)\s+($reg_qtree_name)\s+(\w+)\s+(\w+)\s+(\d+)\s+(\w+)$/ ) {          # v8
			( $vol, $style, $oplocks, $status, $id, $vfiler ) = ( $1, $2, $3, $4, $5, $6 );
		} elsif ( $line =~ /^($reg_vol_name)\s+($reg_qtree_name)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\d+)\s*$/ ) { # v7 and earlier
			( $vol, $tree, $style, $oplocks, $status, $id ) = ( $1, $2, $3, $4, $5, $6 );
		} elsif ( $line =~ /^($reg_path)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\d+)\s*$/ ) {               # v7 and earlier
			( $vol, $style, $oplocks, $status, $id ) = ( $1, $2, $3, $4, $5 );
		} else {
			Carp::croak "Bad Qtree Status Line: [$line]\n";
		}
		my $key = $vol . $id;

		$qtree{$key}{volume}  = $vol;
		$qtree{$key}{tree}    = $tree;
		$qtree{$key}{style}   = $style;
		$qtree{$key}{oplocks} = $oplocks;
		$qtree{$key}{status}  = $status;
		$qtree{$key}{id}      = $id;

	}
	return wantarray ? %qtree : \%qtree;
}

sub parse_sysconfig {
	my %sysconfig = ();
	return ( wantarray ? %sysconfig : \%sysconfig ) unless defined $_[0];

	my @lines = split "\n", $_[0];
	for my $line (@lines) {
		$sysconfig{SERIAL_NUM} = $1 if $line =~ /System Serial Number: (\d+) \(/;
	}

	return wantarray ? %sysconfig : \%sysconfig;
}

sub parse_volstatus {
	my %vols = ();
	return ( wantarray ? %vols : \%vols ) unless defined $_[0];

	my @lines = split "\n", $_[0];
	shift @lines if $lines[0] eq '===== VOL-STATUS =====';

	my @chunk; my @next_chunk; my $header_count;

	for my $line (@lines) {
		next if $line =~ /^[\s-]*$/; # Blank and line rows.

		if ( $line =~ /Volume.*State.*Status.*Options/ ) { # header row
			$header_count++;
			next;
		}

		last if $header_count > 1;

		if ( scalar(@chunk) > 0 and $line =~ /^\s*([\w\-]+)\s+(online|offline)\s+(.+?)\s\s\s+(.+)$/ ) {
			push @next_chunk, $line;

			my ( $volname, $volopts ) = &_parse_volstatus_block(@chunk);
			$vols{$volname} = $volopts;

			@chunk      = @next_chunk;
			@next_chunk = ();
		} else {
			push @chunk, $line;
		}
	}

	if (@chunk) {
		my ( $volname, $volinfo ) = &_parse_volstatus_block(@chunk);
		$vols{$volname} = $volinfo;
	}

	return wantarray ? %vols : \%vols;
}

sub _parse_volstatus_block {
	my @lines = @_;
	my %volinfo;

	my ( $volname, $volstate, $voloptions, $volstatus, $volaggr ) = ('','','','','');
	
	for my $line (@lines) {

		# v7 unused
		next if $line =~ /Plex \//;
		next if $line =~ /RAID group/;
		next if $line =~ /Snapshot autodelete settings/;
		next if $line =~ /Volume autosize settings/;

		# v8
		next if $line =~ /Volume UUID: /;
		next if $line =~ /Volinfo mode: /;
		next if $line =~ /Volume has clones: /;
		next if $line =~ /Clone, backed by volume '/;

		if ( $line =~ /^\s*([\w\-]+)\s+(online|offline|restricted)\s+(.+?)\s\s\s+(.+)$/ ) {
			$volname    = $1;
			$volstate   = $2;
			$volstatus  = $3;
			$voloptions = $4;
		} elsif ( $line =~ /^(\s{27,30}\s*|\t{5})(\S+)\s\s\s+(\S.+)$/ ) { # v7 and earlier
			$volstatus  .= ', ' . $2;
			$voloptions .= $3;
		} elsif ( $line =~ /^(\s{27,30}\s*|\t{5})(.*)$/ ) { # v7 and earlier
			$voloptions .= $2;
		} elsif ( $line =~ /^\s*(\w+=[\w\(\)]+,?)$/ ) {  # v8
			$voloptions .= $1;
		} elsif ( $line =~ /^vol status: Volume '(.*?)' is temporarily busy \(snapmirror destination\)/ ) {
			$volname = $1;
			$volstate = 'busy';
		} elsif ( $line =~ /Containing aggregate: ('[\w\-]+'|<N\/A>)/ ) {
			$volaggr = $1;
			$volaggr = $1 if $volaggr =~ /^'(.+)'$/;
		} else {
			Carp::croak "Bad Vol Status Line: [$line]\n";
		}
	}

	$volinfo{state}     = $volstate;
	$volinfo{status}    = $volstatus;
	$volinfo{options}   = $voloptions;
	$volinfo{aggregate} = $volaggr;
	$volinfo{notes}     = '';

        $volinfo{notes} = 'Volume is offline' if $volstate eq 'offline';
        $volinfo{notes} = 'Volume is busy'    if $volstate eq 'busy';
	push(@Parse::NetApp::ASUP::concerns, "$volname is marked as $volstate") if $volstate eq 'offline' or $volstate eq 'busy';

	return ( $volname, \%volinfo );
}

sub parse_xheader {
	my %xheader = ();
	return ( wantarray ? %xheader : \%xheader ) unless defined $_[0];

	my @lines = split "\n", $_[0];
	shift @lines if $lines[0] eq '===== X-HEADER DATA =====';

	for my $line (@lines) {
		next if $line =~ /^\s*$/;
		if ( $line =~ /^([\w\-]+): (.*)$/ ) {
			$xheader{$1} = $2;
		} else {
			Carp::croak "Bad x-header line: [$line]";
		}
	}

	return wantarray ? %xheader : \%xheader;
}

### Overall methods

=head3 Parse::NetApp::ASUP::asup_version($raw)

Given the entire text of an ASUP, it returns the version of the file.

=cut

sub asup_version {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	my $version;
	for my $line ( split '\n', $raw ) {
		next unless $line =~ /^VERSION=NetApp Release ([\w\.\d]+)/;
		$version = $1;
		last;
	}
	return $version if defined $version;	
	for my $line ( split '\n', $raw ) {
		next unless $line =~ /^X-Netapp-asup-os-version: NetApp Release ([\w\.\d]+)/;
		$version = $1;
		last;
	}
	return $version ? $version : 'unknown';
}	

=head3 Parse::NetApp::ASUP::dave($raw)

Given the entire text of an ASUP, it returns a "dave" version of the file.

=cut

sub dave {
	my $raw = defined $_[0]->{asup} ? $_[0]->{asup} : $_[0];
	return undef unless length $raw;
	my $dave;

	$dave .= Parse::NetApp::ASUP::extract_headers($raw);
	$dave .= Parse::NetApp::ASUP::extract_xheader($raw);
	$dave .= Parse::NetApp::ASUP::extract_sysconfig_a($raw);
	$dave .= Parse::NetApp::ASUP::extract_sysconfig_c($raw);
	$dave .= Parse::NetApp::ASUP::extract_sysconfig_d($raw);
	$dave .= Parse::NetApp::ASUP::extract_system_serial_number($raw);
	$dave .= Parse::NetApp::ASUP::extract_software_licenses($raw);
	$dave .= Parse::NetApp::ASUP::extract_options($raw);
	$dave .= Parse::NetApp::ASUP::extract_service_usage($raw);
	$dave .= Parse::NetApp::ASUP::extract_cluster_monitor($raw);
	$dave .= Parse::NetApp::ASUP::extract_cf_monitor($raw);
	$dave .= Parse::NetApp::ASUP::extract_interconnect_config($raw);
	$dave .= Parse::NetApp::ASUP::extract_interconnect_stats($raw);
	$dave .= Parse::NetApp::ASUP::extract_ifconfig_a($raw);
	$dave .= Parse::NetApp::ASUP::extract_ifstat_a($raw);
	$dave .= Parse::NetApp::ASUP::extract_vif_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_vlan_stat($raw);
	$dave .= Parse::NetApp::ASUP::extract_nis_info($raw);
	$dave .= Parse::NetApp::ASUP::extract_cifs_stat($raw);
	$dave .= Parse::NetApp::ASUP::extract_cifs_sessions($raw);
	$dave .= Parse::NetApp::ASUP::extract_cifs_shares($raw);
	$dave .= Parse::NetApp::ASUP::extract_cifs_domaininfo($raw);
	$dave .= Parse::NetApp::ASUP::extract_vol_language($raw);
	$dave .= Parse::NetApp::ASUP::extract_httpstat($raw);
	$dave .= Parse::NetApp::ASUP::extract_df($raw);
	$dave .= Parse::NetApp::ASUP::extract_df_i($raw);
	$dave .= Parse::NetApp::ASUP::extract_aggr_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_df_a($raw);
	$dave .= Parse::NetApp::ASUP::extract_df_r($raw);
	$dave .= Parse::NetApp::ASUP::extract_df_s($raw);
	$dave .= Parse::NetApp::ASUP::extract_snap_sched($raw);
	$dave .= Parse::NetApp::ASUP::extract_vol_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_sysconfig_r($raw);
	$dave .= Parse::NetApp::ASUP::extract_unowned_disks($raw);
	$dave .= Parse::NetApp::ASUP::extract_failed_disk_registry($raw);
	$dave .= Parse::NetApp::ASUP::extract_fc_stats($raw);
	$dave .= Parse::NetApp::ASUP::extract_fc_device_map($raw);
	$dave .= Parse::NetApp::ASUP::extract_fc_link_stats($raw);
	$dave .= Parse::NetApp::ASUP::extract_ecc_memory_scrubber_stats($raw);
	$dave .= Parse::NetApp::ASUP::extract_usage($raw);
	$dave .= Parse::NetApp::ASUP::extract_acp_list_all($raw);
	$dave .= Parse::NetApp::ASUP::extract_rc($raw);
	$dave .= Parse::NetApp::ASUP::extract_hosts($raw);
	$dave .= Parse::NetApp::ASUP::extract_dns_info($raw);
	$dave .= Parse::NetApp::ASUP::extract_resolv_conf($raw);
	$dave .= Parse::NetApp::ASUP::extract_exports($raw);
	$dave .= Parse::NetApp::ASUP::extract_environment($raw);
	$dave .= Parse::NetApp::ASUP::extract_fcp_cfmode($raw);
	$dave .= Parse::NetApp::ASUP::extract_fcp_initiator_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_fcp_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_fcp_target_adapters($raw);
	$dave .= Parse::NetApp::ASUP::extract_fcp_target_configuration($raw);
	$dave .= Parse::NetApp::ASUP::extract_fcp_target_stats($raw);
	$dave .= Parse::NetApp::ASUP::extract_flash_card_info($raw);
	$dave .= Parse::NetApp::ASUP::extract_fmm_data($raw);
	$dave .= Parse::NetApp::ASUP::extract_fpolicy($raw);
	$dave .= Parse::NetApp::ASUP::extract_hwassist_stats($raw);
	$dave .= Parse::NetApp::ASUP::extract_ifgrp_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_initiator_groups($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_alias($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_connections($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_initiator_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_interface($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_interface_accesslist($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_isns($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_nodename($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_portals($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_security($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_sessions($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_statistics($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_iscsi_target_portal_groups($raw);
	$dave .= Parse::NetApp::ASUP::extract_portsets($raw);
	$dave .= Parse::NetApp::ASUP::extract_lun_config_check($raw);
	$dave .= Parse::NetApp::ASUP::extract_lun_configuration($raw);
	$dave .= Parse::NetApp::ASUP::extract_lun_hist($raw);
	$dave .= Parse::NetApp::ASUP::extract_lun_statistics($raw);
	$dave .= Parse::NetApp::ASUP::extract_nbtstat_c($raw);
	$dave .= Parse::NetApp::ASUP::extract_netstat_s($raw);
	$dave .= Parse::NetApp::ASUP::extract_route_gsn($raw);
	$dave .= Parse::NetApp::ASUP::extract_nfsstat_cc($raw);
	$dave .= Parse::NetApp::ASUP::extract_nfsstat_d($raw);
	$dave .= Parse::NetApp::ASUP::extract_nsswitch_conf($raw);
	$dave .= Parse::NetApp::ASUP::extract_priority_show($raw);
	$dave .= Parse::NetApp::ASUP::extract_qtree_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_quotas($raw);
	$dave .= Parse::NetApp::ASUP::extract_sas_adapter_state($raw);
	$dave .= Parse::NetApp::ASUP::extract_sas_dev_stats($raw);
	$dave .= Parse::NetApp::ASUP::extract_sas_expander_map($raw);
	$dave .= Parse::NetApp::ASUP::extract_sas_expander_phy_state($raw);
	$dave .= Parse::NetApp::ASUP::extract_sas_shelf($raw);
	$dave .= Parse::NetApp::ASUP::extract_shelf_log_esh($raw);
	$dave .= Parse::NetApp::ASUP::extract_shelf_log_iom($raw);
	$dave .= Parse::NetApp::ASUP::extract_sis_stat($raw);
	$dave .= Parse::NetApp::ASUP::extract_sis_stat_l($raw);
	$dave .= Parse::NetApp::ASUP::extract_sis_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_sis_status_l($raw);
	$dave .= Parse::NetApp::ASUP::extract_snap_list_n($raw);
	$dave .= Parse::NetApp::ASUP::extract_snap_list_n_a($raw);
	$dave .= Parse::NetApp::ASUP::extract_snap_reserve($raw);
	$dave .= Parse::NetApp::ASUP::extract_snap_reserve_a($raw);
	$dave .= Parse::NetApp::ASUP::extract_snap_sched_a($raw);
	$dave .= Parse::NetApp::ASUP::extract_snap_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_snap_status_a($raw);
	$dave .= Parse::NetApp::ASUP::extract_snapmirror_destinations($raw);
	$dave .= Parse::NetApp::ASUP::extract_snapmirror_status($raw);
	$dave .= Parse::NetApp::ASUP::extract_sm_allow($raw);
	$dave .= Parse::NetApp::ASUP::extract_sm_conf($raw);
	$dave .= Parse::NetApp::ASUP::extract_snapvault_destinations($raw);
	$dave .= Parse::NetApp::ASUP::extract_snapvault_snap_sched($raw);
	$dave .= Parse::NetApp::ASUP::extract_snapvault_status_l($raw);
	$dave .= Parse::NetApp::ASUP::extract_snaplock($raw);
	$dave .= Parse::NetApp::ASUP::extract_snaplock_clock($raw);
	$dave .= Parse::NetApp::ASUP::extract_ssh($raw);
	$dave .= Parse::NetApp::ASUP::extract_storage($raw);
	$dave .= Parse::NetApp::ASUP::extract_sysconfig_ac($raw);
	$dave .= Parse::NetApp::ASUP::extract_sysconfig_hardware_ids($raw);
	$dave .= Parse::NetApp::ASUP::extract_sysconfig_m($raw);
	$dave .= Parse::NetApp::ASUP::extract_usermap_cfg($raw);
	$dave .= Parse::NetApp::ASUP::extract_vfiler_startup_times($raw);
	$dave .= Parse::NetApp::ASUP::extract_vfilers($raw);
	$dave .= Parse::NetApp::ASUP::extract_vscan($raw);
	$dave .= Parse::NetApp::ASUP::extract_vscan_options($raw);
	$dave .= Parse::NetApp::ASUP::extract_vscan_scanners($raw);
	$dave .= Parse::NetApp::ASUP::extract_messages($raw);

	return $dave;
}

=head3 Parse::NetApp::ASUP::extract($raw)

Extract the raw sections of the data into a hash structure.

=cut

sub extract {
  my $raw = shift @_;

  my $version = Parse::NetApp::ASUP::asup_version($raw);  
  $version =~ /^(\d)\.(\d)/;
  my $maj = $1;
  my $min = $2;

  my $extracts;
  
  if ( $maj == 8 and $min > 0 ) {
    my $export     = Parse::NetApp::ASUP::extract_exports($raw);
    my $lun_conf   = Parse::NetApp::ASUP::extract_lun_configuration($raw);
    my $qtree_stat = Parse::NetApp::ASUP::extract_qtree_status($raw);
    my $xheader    = Parse::NetApp::ASUP::extract_xheader($raw);

    $extracts = ASUP::iterative_extract($raw);
    $extracts->{_METHOD} = 'Progressive';
    
    $extracts->{export}     = $export;
    $extracts->{lun_conf}   = $lun_conf;
    $extracts->{qtree_stat} = $qtree_stat;    
    $extracts->{xheader}    = $xheader;
  } else {
    $extracts->{_METHOD} = 'Singular';
    $extracts->{xml} = [];

    $extracts->{df}           = Parse::NetApp::ASUP::extract_df($raw);
    $extracts->{export}       = Parse::NetApp::ASUP::extract_exports($raw);
    $extracts->{header}       = Parse::NetApp::ASUP::extract_headers($raw);
    $extracts->{lun_conf}     = Parse::NetApp::ASUP::extract_lun_configuration($raw);
    $extracts->{qtree_stat}   = Parse::NetApp::ASUP::extract_qtree_status($raw);
    $extracts->{sysconfig_a}  = Parse::NetApp::ASUP::extract_sysconfig_a($raw);
    $extracts->{vol_status}   = Parse::NetApp::ASUP::extract_vol_status($raw);
    $extracts->{xheader}      = Parse::NetApp::ASUP::extract_xheader($raw);
  }

  $extracts->{_VERSION} = $version;        
  return $extracts;
}

=head3 Parse::NetApp::Parse::NetApp::ASUP::parse($raw)

Given the entire text of an ASUP, it returns an array of hash references
that are used in the LOE generator:

  ( \%header, \%luns, \%qtree, \%vols )

=cut

sub parse {
	my $asup = shift @_;
	my $extracts = ASUP::extract($asup);
	
	my $df           = $extracts->{df};
	my $export       = $extracts->{export};
	my $header       = $extracts->{header};
	my $lun_conf     = $extracts->{lun_conf};
	my $qtree_stat   = $extracts->{qtree_stat};
	my $sysconfig_a  = $extracts->{sysconfig_a};
	my $vol_status   = $extracts->{vol_status};
	my $xheader      = $extracts->{xheader};

	Interface::warning("NO DF DATA IN ASUP")     unless $df;
	Interface::warning("NO EXPORT DATA IN ASUP") unless $export;
	Interface::warning("NO HEADER DATA IN ASUP") unless $header;
	# It's ok not to have LUN conf data
	Interface::warning("NO QTREE STATUS IN ASUP")      unless $qtree_stat;
	Interface::warning("NO SYSYCONFIG-A DATA IN ASUP") unless $sysconfig_a;
	Interface::warning("NO VOL-STATUS DATA IN ASUP")   unless $vol_status;
	Interface::warning("NO X-HEADER DATA IN ASUP")     unless $xheader;

	# Parse header data;

	my %header = Parse::NetApp::ASUP::parse_header($header);
	Interface::message("Filer version is $header{short_version}");
	my %xheader = Parse::NetApp::ASUP::parse_xheader($xheader);
        for my $key ( keys %xheader ) { $header{$key} = $xheader{$key} unless defined $header{$key}; }

	# Parse sysconfig data

	my %sysconfig = Parse::NetApp::ASUP::parse_sysconfig($sysconfig_a);

	# Add to header info, unless already there
	for my $key ( keys %sysconfig ) {
		if ( defined $header{$key} and $key ne 'SERIAL_NUM' ) {
			Interface::warning("Skipping duplicate sysconfig data of type $key alread found in \%header");
			push(@Parse::NetApp::ASUP::concerns,"Duplicate header data of type $key");
		} elsif ( defined $header{$key} and $header{$key} ne $sysconfig{$key} ) {
			Interface::warning("Duplicate header key of $key has varying data: [$header{$key}] vs [$sysconfig{$key}]");
			push(@Parse::NetApp::ASUP::concerns,"Duplicate and varied header data of type $key");
		} else {
			$header{$key} = $sysconfig{$key};
		}
	}

	# Parse LUN CONFiguration

	my %luns = Parse::NetApp::ASUP::parse_lun($lun_conf);
	Interface::message("No lun data found.") unless scalar( keys %luns ) or not defined $lun_conf;

	# Parse DF

	my %vols = Parse::NetApp::ASUP::parse_df($df);
	Interface::warning("NO VOLUME DATA!") unless scalar( keys %vols );

	# Parse qtree status data

	my %qtree = Parse::NetApp::ASUP::parse_qtree($qtree_stat);

	# Form a deduped list of styles of qtree on each volume for the Volume tab
	my %dedupe;
	for my $key ( keys %qtree ) {
		my $vol   = $qtree{$key}{volume};
		my $style = $qtree{$key}{style};
		$dedupe{$vol}{$style}++;
	}

	for my $vol ( keys %dedupe ) {
		my @qtree_styles = sort keys %{ $dedupe{$vol} };
		$vols{$vol}{qtree} = join( ', ', @qtree_styles );
	}

	# parse Volstatus data

	my %volstatus = Parse::NetApp::ASUP::parse_volstatus($vol_status);

	# Add to vol info, unless already there
	for my $volume ( keys %volstatus ) {
		for my $key ( keys %{ $volstatus{$volume} } ) {

			if ( defined $vols{$volume}{$key} ) {
				Interface::warning("Skipping duplicate volstatus data of type $key alread found in \%vols");
			} else {
				$vols{$volume}{$key} = $volstatus{$volume}{$key};
			}
		}
	}

	# Parse Export dara

	my %export = Parse::NetApp::ASUP::parse_export($export);

	for my $exported ( keys %export ) {
		for my $volume ( keys %vols ) {
			my $test = defined $vols{$volume}{mounted_on} ? $vols{$volume}{mounted_on} : '';
			chop $test if $test =~ /\/$/; # The export can have a closing slash
			if ( $exported =~ /^$test$/ ) {
				$vols{$volume}{export} = $export{$exported};
			}
		}
	}

	return ( \%header, \%luns, \%qtree, \%vols );
}


1;

=head1 AUTHORSHIP:

  Parse::NetApp::ASUP vVERSIONTAG DATETAG

  (c) 2012-YEARTAG, Phillip Pollard <bennie@cpan.org>
  Released under the Perl Artistic License