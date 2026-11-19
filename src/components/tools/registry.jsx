// Maps a catalog slug to its React component.
// Every tool page is rendered by app/pages/ToolDetailPage.jsx from this map.

import React from 'react';
import { SubnetCalculator } from './SubnetCalculator';
import { DnsLookup } from './DnsLookup';
import { IpAddressInfo } from './IpAddressInfo';
import { PortReference } from './PortReference';
import { ProtocolExplorer } from './ProtocolExplorer';
import { BandwidthCalculator } from './BandwidthCalculator';
import { LinuxTerminal } from './LinuxTerminal';
import { PortScanner } from './PortScanner';
import { HashUtility } from './HashUtility';
import { BinaryConverter } from './BinaryConverter';
import { RaidCalculator } from './RaidCalculator';
import { PsuCalculator } from './PsuCalculator';
import { PasswordStrength } from './PasswordStrength';
import { StorageConverter } from './StorageConverter';
import { CloudCostCalculator } from './CloudCostCalculator';
import { AiTokenCalculator } from './AiTokenCalculator';
import { AspectRatioCalculator } from './AspectRatioCalculator';
import { ColorContrastTool } from './ColorContrastTool';
import { OfficeToolkit } from './OfficeToolkit';
import { DomainInspector } from './DomainInspector';

import { CidrNetmask, IpRangeCidr, DhcpLease, MacOui, Ipv6Subnet, WifiChannels, CableBudget } from './networkingExtra';
import { SpeedTest } from './SpeedTest';
import { SiteStatus } from './SiteStatus';
import { SubnetDrill, PortQuiz } from './practice';
import { ChmodCalculator, CronBuilder, LinuxCheatsheet, SystemdUnit, DiskPlanner } from './linuxTools';
import { RamCompatibility, StorageIops, UpsRuntime, RackPlanner } from './hardwareExtra';
import { HashGenerator, FileChecksum, JwtDecoder, PasswordGenerator, CvssCalculator } from './securityExtra';
import { NmapBuilder, WordlistGenerator, EncodingChain } from './hackingExtra';
import { VpcSubnetPlanner, StorageClassComparator, DataTransferCost, K8sResources, SlaDowntime } from './cloudExtra';
import { RequestJourney, LoadBalancerSim, CacheSimulator, RateLimiterSim, CapacityEstimator, QuorumCalculator } from './systemDesign';
import { AutoscalingSim } from './autoscaling';
import { MorseTranslator, TimestampConverter } from './miscTools';
import { TypingSpeedTest, PomodoroTimer, WordCounter, GradeCalculator, CitationGenerator, ExamCountdown } from './studentTools';
import { JsonFormatter, RegexTester, EmbeddingCost, RagChunkPlanner, ContextWindow } from './aiExtra';
import { PaletteGenerator, ColorConverter, DpiCalculator, GradientGenerator, ImageResizer } from './designExtra';
import { NumberDrill, AsciiTable, DataRateConverter, LogicGates, FileSizeEstimator } from './fundamentalsExtra';
import { VlookupConverter, DateCalculator, CsvJson } from './officeExtra';

export const TOOL_COMPONENTS = {
  // Networking
  'subnet-calculator': SubnetCalculator,
  'dns-lookup': DnsLookup,
  'port-reference': PortReference,
  'ip-address-info': IpAddressInfo,
  'cidr-netmask': CidrNetmask,
  'protocol-explorer': ProtocolExplorer,
  'bandwidth-calculator': BandwidthCalculator,
  'ip-range-cidr': IpRangeCidr,
  'dhcp-lease': DhcpLease,
  'mac-oui': MacOui,
  'ipv6-subnet': Ipv6Subnet,
  'wifi-channels': WifiChannels,
  'cable-budget': CableBudget,
  'speed-test': SpeedTest,
  'site-status': SiteStatus,
  'subnet-drill': SubnetDrill,
  'port-quiz': PortQuiz,

  // Linux & Systems
  'linux-terminal': LinuxTerminal,
  'chmod-calculator': ChmodCalculator,
  'cron-builder': CronBuilder,
  'linux-cheatsheet': LinuxCheatsheet,
  'systemd-unit': SystemdUnit,
  'disk-planner': DiskPlanner,

  // Hardware
  'raid-calculator': RaidCalculator,
  'psu-calculator': PsuCalculator,
  'ram-compatibility': RamCompatibility,
  'storage-iops': StorageIops,
  'ups-runtime': UpsRuntime,
  'rack-planner': RackPlanner,

  // Cyber Security
  'password-strength': PasswordStrength,
  'hash-generator': HashGenerator,
  'encoder-decoder': HashUtility,
  'jwt-decoder': JwtDecoder,
  'file-checksum': FileChecksum,
  'password-generator': PasswordGenerator,
  'cvss-calculator': CvssCalculator,

  // Ethical Hacking
  'domain-inspector': DomainInspector,
  'port-analyzer': PortScanner,
  'nmap-builder': NmapBuilder,
  'wordlist-generator': WordlistGenerator,
  'encoding-chain': EncodingChain,

  // Cloud
  'cloud-cost-calculator': CloudCostCalculator,
  'vpc-subnet-planner': VpcSubnetPlanner,
  'storage-class-comparator': StorageClassComparator,
  'data-transfer-cost': DataTransferCost,
  'k8s-resources': K8sResources,
  'sla-downtime': SlaDowntime,

  // System Design
  'request-journey': RequestJourney,
  'load-balancer-sim': LoadBalancerSim,
  'autoscaling-simulator': AutoscalingSim,
  'cache-simulator': CacheSimulator,
  'rate-limiter': RateLimiterSim,
  'capacity-estimator': CapacityEstimator,
  'quorum-calculator': QuorumCalculator,
  'morse-code': MorseTranslator,
  'timestamp-converter': TimestampConverter,

  // Student Toolkit
  'typing-test': TypingSpeedTest,
  'pomodoro-timer': PomodoroTimer,
  'word-counter': WordCounter,
  'cgpa-calculator': GradeCalculator,
  'citation-generator': CitationGenerator,
  'exam-countdown': ExamCountdown,

  // AI & Automation
  'ai-token-calculator': AiTokenCalculator,
  'json-formatter': JsonFormatter,
  'regex-tester': RegexTester,
  'embedding-cost': EmbeddingCost,
  'rag-chunk-planner': RagChunkPlanner,
  'context-window': ContextWindow,

  // Graphic Design
  'color-contrast': ColorContrastTool,
  'aspect-ratio': AspectRatioCalculator,
  'palette-generator': PaletteGenerator,
  'color-converter': ColorConverter,
  'dpi-calculator': DpiCalculator,
  'gradient-generator': GradientGenerator,
  'image-resizer': ImageResizer,

  // Computer Fundamentals
  'binary-converter': BinaryConverter,
  'storage-converter': StorageConverter,
  'number-drill': NumberDrill,
  'ascii-table': AsciiTable,
  'data-rate-converter': DataRateConverter,
  'logic-gates': LogicGates,
  'file-size-estimator': FileSizeEstimator,

  // Microsoft Office 365
  'office-toolkit': OfficeToolkit,
  'vlookup-converter': VlookupConverter,
  'date-calculator': DateCalculator,
  'csv-json': CsvJson,
};

export const getToolComponent = (slug) => TOOL_COMPONENTS[slug] || null;

// Returns a ready element so the route file does not create a component
// during render (which would remount and reset tool state on every visit).
export const renderTool = (slug) => {
  const Component = TOOL_COMPONENTS[slug];
  return Component ? React.createElement(Component, { isStandalone: true }) : null;
};
