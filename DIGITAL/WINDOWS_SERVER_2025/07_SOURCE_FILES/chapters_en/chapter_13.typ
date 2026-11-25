// =============================================================================
// CHAPTER 13: BACKUP, DISASTER RECOVERY & ACTIVE DIRECTORY RECYCLE BIN
// =============================================================================

[#metadata("ch13") <chapter-13>]

#chapter-header(
  chapter-num: "CHAPTER 13",
  category: "PART 13: ENTERPRISE DISASTER RECOVERY & SYSTEM BACKUP",
  title: "Enterprise Backup, Disaster Recovery & #hl-yellow[Active Directory Recycle Bin]",
  subtitle: "3-2-1 Enterprise Backup Strategy · #hl-yellow[Windows Server Backup] · Full vs #hl-yellow[System State Backup] · Enabling AD Recycle Bin · 1-Click Online Restore · wbadmin Scripting"
)

=== 13.1 Enterprise Backup Strategy: The Golden 3-2-1 Rule
The true measure of a seasoned systems administrator is not how smoothly things run during normal operations, but how swiftly the infrastructure recovers when disaster strikes—whether triggered by a datacenter fire, a targeted ransomware outbreak, or a junior admin inadvertently deleting an entire organizational unit!

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/backup_disaster_recovery_flow.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 13.1: 3-2-1 Enterprise Backup Architecture & #hl-yellow[Active Directory Recycle Bin] 1-Click Live Recovery]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[The Golden 3-2-1 Backup Rule (Global Industry Standard):]\
    - #text(weight: "bold", fill: rtech-blue)[3 Copies of Data:] Maintain at least three copies of critical data (1 production original + 2 independent backup copies).
    - #text(weight: "bold", fill: rtech-amber)[2 Different Storage Media:] Store backups across at least two distinct storage technologies (e.g., one copy on local NVMe NAS/SAN disk storage and the second on LTO tape drives or cloud object storage).
    - #text(weight: "bold", fill: rtech-rose)[1 Offsite Immutable Copy:] Maintain at least one backup geographically separated in a secondary datacenter or secure cloud tier that is immutable (Write Once Read Many - WORM), ensuring ransomware cannot encrypt or delete it.
  ]
)

#v(6pt)

=== 13.2 Installing the #hl-yellow[Windows Server Backup] Feature
Microsoft provides a robust, native backup solution built directly into Windows Server:

1. Open #hl-yellow[Server Manager] -> click #hl-green[Add Roles and Features].
2. Click 'Next' through the installation wizard to reach the Features screen.
3. Scroll through the features list and check: #mark-yellow[Windows Server Backup].
4. Click 'Install'. This feature provisions both the graphical management console (`wbadmin.msc`) and the powerful command-line utility (`wbadmin.exe`).

#v(6pt)

=== 13.3 Full Server Backup vs. #hl-yellow[System State Backup]
- #text(weight: "bold", fill: rtech-navy)[Bare Metal Recovery (BMR):] A comprehensive backup encompassing the entire server operating environment (system volume C:, boot partitions, installed applications, drivers, and local state). If physical hardware suffers catastrophic failure or fire, bare metal recovery allows complete restoration onto unformatted bare hardware.
- #text(weight: "bold", fill: rtech-blue)[System State Backup:] The most critical backup for an Active Directory Domain Controller. It captures exclusively the vital system components necessary to reconstruct directory services:
  1. #hl-yellow[Active Directory Database (`ntds.dit`)]
  2. #hl-green[SYSVOL Shared Folder (all Group Policy Objects and logon scripts)]
  3. #hl-orange[Windows System Registry]
  4. #hl-green[Boot Files and System Startup Binaries]
  5. #hl-green[Certificate Services Database (if AD CS is installed on the host)]

*Master Command to Execute an Immediate #hl-yellow[System State Backup] via CLI:*
```cmd
wbadmin start systemstatebackup -backupTarget:E: -quiet
```

#v(6pt)

=== 13.4 Enabling the #hl-yellow[Active Directory Recycle Bin] (AD Recycle Bin)
In legacy Windows Server editions (2003/2008), inadvertently deleting an organizational unit (OU) or user account triggered an operational nightmare. Restoring the object required rebooting the Domain Controller into #hl-orange[Directory Services Restore Mode (#hl-orange[DSRM])], taking services offline, and performing an 'Authoritative Restore' via `ntdsutil`—incurring 2 to 3 hours of critical enterprise downtime.

#mark-yellow[The #hl-yellow[Active Directory Recycle Bin] is a game-changing capability that restores accidentally deleted directory objects live, in 1-click, with zero server reboots and zero service downtime!]

*Official PowerShell Cmdlet to Enable the AD Recycle Bin:*
```powershell
Enable-ADOptionalFeature -Identity "Recycle Bin Feature" `
  -Scope ForestOrConfigurationSet -Target "corp.rtechlab.local"
```
#warning-box(title: "Irreversible Action (Permanent Activation)")[
  Once the #hl-yellow[Active Directory Recycle Bin] feature is enabled across the forest, it cannot be disabled. It represents a permanent, highly secure, one-way architectural upgrade.
]

#v(6pt)

=== 13.5 Live 1-Click Restoration of Deleted Users & OUs
Once the AD Recycle Bin is enabled, deleted objects are not purged immediately; instead, they transition into the #hl-yellow[`Deleted Objects`] container while retaining their full attribute state (default tombstone lifetime: #hl-green[180 days]):

1. Navigate to #hl-yellow[Server Manager] -> Tools -> #hl-green[Active Directory Administrative Center (ADAC)] (or launch via Run: #mark-green[`dsac.exe`]).
2. In the left navigation pane, select your domain `#text(weight: "bold")[corp (local)]`.
3. In the management view, double-click the newly visible #mark-yellow[Deleted Objects] container.
4. Locate the deleted user account (e.g., `Rahul Patel`).
5. Right-click the deleted user and choose:
   - #hl-green[Restore:] The user account is instantly restored back to its exact original OU (`Corporate-Departments -> HR`)!
   - #hl-yellow[Restore To...:] If the parent OU was also deleted or restructured, select an alternative destination OU.
6. *The Enterprise Miracle:* The user's original password hash, all nested security group memberships, and internal SID (Security Identifier) remain 100% intact! The employee can immediately log in without a password reset.

#v(6pt)

=== 13.6 `wbadmin` Command-Line Backup Scheduling & Automation
In enterprise production, administrators schedule automated daily backups at 11:00 PM via Windows Task Scheduler or administrative scripts:

```cmd
:: Daily Unattended #hl-yellow[System State Backup] Script
wbadmin enable backup -addtarget:{GUID-Storage-Drive} -schedule:23:00 -systemState -include:C:
```

#v(8pt)

// =============================================================================
// CHAPTER 13 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  When an object is deleted in Active Directory without the Recycle Bin enabled, it is not immediately purged; rather, it transitions into a stripped 'tombstone' state. While tombstones persist by default for 180 days, almost all critical object attributes—including passwords, group memberships, and contact details—are permanently stripped away. The #hl-yellow[Active Directory Recycle Bin] solves this limitation by preserving 100% of an object's attributes in live, restorable form!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 13 Practice Multiple Choice Questions (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "According to the global enterprise '3-2-1 Backup Rule', what is the minimum required number of independent copies of data?",
  optA: "Only 1 copy",
  optB: "At least 2 copies",
  optC: "At least 3 copies (1 production + 2 backups)",
  optD: "10 copies",
  ans: "C",
  exp: "The 3-2-1 rule mandates 3 copies of data, across 2 different storage media types, with 1 copy stored securely offsite."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "Which of the following components is NOT included in an Active Directory Domain Controller's '#hl-yellow[System State Backup]'?",
  optA: "Active Directory Database (ntds.dit)",
  optB: "SYSVOL Folder",
  optC: "System Registry",
  optD: "User personal video files stored on drive D:",
  ans: "D",
  exp: "#hl-yellow[System State Backup] captures operating system configuration and directory infrastructure files only, never arbitrary user data files."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "When the Active Directory Recycle Bin is enabled, for how many days do deleted objects remain protected in the 'Deleted Objects' container by default?",
  optA: "30 days",
  optB: "60 days",
  optC: "90 days",
  optD: "180 days (Deleted Object Lifetime)",
  ans: "D",
  exp: "Microsoft sets the default Deleted Object Lifetime (tombstone lifetime) to 180 days."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Which official command-line utility is used to initiate an immediate System State Backup from the Windows Command Prompt?",
  optA: "robocopy.exe",
  optB: "wbadmin.exe",
  optC: "ntdsutil.exe",
  optD: "dcdiag.exe",
  ans: "B",
  exp: "The command 'wbadmin start systemstatebackup' is the official CLI utility for initiating system state backups."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "Which graphical management console provides direct access to the 'Deleted Objects' container for 1-click live recovery of deleted users?",
  optA: "#hl-yellow[Active Directory Users and Computers] (dsa.msc)",
  optB: "#hl-yellow[Active Directory Administrative Center] (dsac.exe)",
  optC: "#hl-yellow[Group Policy Management Console] (gpmc.msc)",
  optD: "Disk Management (diskmgmt.msc)",
  ans: "B",
  exp: "#hl-yellow[Active Directory Administrative Center] (ADAC - dsac.exe) houses the graphical Deleted Objects container."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Vault (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'What is the architectural difference between Authoritative Restore and Non-Authoritative Restore in Active Directory?'",
  a: "Answer: When restoring a Domain Controller from backup, the default operation is 'Non-Authoritative'—meaning that once restored, the DC contacts replication partners across the network and synchronizes itself to their more recent Update Sequence Numbers (USNs). However, if an entire critical OU was inadvertently deleted domain-wide, an administrator performs an 'Authoritative Restore' using `ntdsutil`. This intentionally increments the USN numbers of the restored branch by 100,000, forcing all other DCs in the forest to recognize the restored data as newer and replicate it back across the enterprise.",
  tip: "This is the benchmark discriminator question in L2/L3 Active Directory directory services interviews at HCL, Infosys, and TCS."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'After restoring a deleted user account via the Active Directory Recycle Bin, do you need to reset their password?'",
  a: "Answer: Absolutely not! That is the fundamental brilliance of the AD Recycle Bin. When restored, the user account retains its exact original password hash, original security identifier (SID), all nested security group memberships, and more than 150 internal directory attributes intact. The user can log in immediately with their existing password.",
  tip: "Highlights your practical understanding of directory identity preservation."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'What do RTO and RPO mean in enterprise datacenter disaster recovery?'",
  a: "Answer: RTO (Recovery Time Objective) is the maximum acceptable duration of system downtime before business operations must be restored (e.g., within 2 hours). RPO (Recovery Point Objective) is the maximum acceptable age of data files that must be recovered for normal operations to resume (e.g., if backups run at midnight and failure hits at 2:00 PM, the business experiences a 14-hour RPO data loss). The architect's goal is to drive both RTO and RPO as close to zero as budget permits.",
  tip: "A fundamental concept across disaster recovery, business continuity, and Service Level Agreements (SLAs)."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'Can you save a Windows Server System State Backup to the local C: volume where the operating system resides?'",
  a: "Answer: No. #hl-yellow[Windows Server Backup] explicitly prohibits storing a system state backup on the same volume (C:) that is being backed up. An administrator must target a dedicated physical or virtual disk (such as drive E:) or a remote SMB network share.",
  tip: "A crisp operational question that verifies real-world lab and implementation experience."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "Interviewer: 'Can the Active Directory Recycle Bin feature be turned off after it has been enabled?'",
  a: "Answer: No. In accordance with Microsoft Active Directory architecture, enabling the Recycle Bin is a permanent, one-way operation. Once enabled at the forest functional level, it cannot be disabled.",
  tip: "A standard architectural fact tested in Microsoft certifications and enterprise technical interviews."
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ Disaster Recovery & Backup Troubleshooting Quick Guide:]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-rose)[Error 1: 'The backup target volume is invalid':] Windows Server prohibits saving a backup on the active OS volume C:; always designate a dedicated secondary drive (E:) or SMB network share.
      - #text(weight: "bold", fill: rtech-amber)[Error 2: '#hl-green[VSS] Writer timed out (Event ID 8229)':] Triggered by contention with third-party backup agents; verify service status using `vssadmin list writers`.
      - #text(weight: "bold", fill: rtech-emerald)[Error 3: 'Recycle Bin Deleted Objects folder not appearing':] Close and relaunch #hl-yellow[Active Directory Administrative Center] (ADAC) or press F5 to force a refresh.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ Chapter 13 Verification Checklist (Disaster Recovery Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] #hl-yellow[Windows Server Backup] feature and PowerShell modules installed successfully.
      - [ ] Active Directory Recycle Bin feature permanently enabled across the entire forest.
      - [ ] Validated 1-click live restoration of a deleted test user from ADAC's 'Deleted Objects' container.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 13 Key Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - The 3-2-1 backup rule forms the international bedrock of enterprise data protection.
      - System State Backups protect the core directory infrastructure (`ntds.dit`, `SYSVOL`, Registry).
      - Active Directory Recycle Bin provides instant 1-click live recovery of accidentally deleted objects without server reboots.
    ]
  ]
)

#pagebreak()
