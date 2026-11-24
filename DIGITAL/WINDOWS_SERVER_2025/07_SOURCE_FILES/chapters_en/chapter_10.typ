// =============================================================================
// CHAPTER 10: FILE SERVER RESOURCE MANAGER (FSRM), NTFS & QUOTA MANAGEMENT
// =============================================================================

[#metadata("ch10") <chapter-10>]

#chapter-header(
  chapter-num: "CHAPTER 10",
  category: "PART 10: STORAGE, SHARING & FILE RESOURCE MANAGEMENT (Storage & FSRM)",
  title: "File Server Resource Manager (FSRM), NTFS Permissions & Quota Management",
  subtitle: "Shared Folders · SMB 3.1.1 · Share vs NTFS Permissions (Effective Formula) · FSRM Role · Hard vs Soft Storage Quotas · File Screening (MP3/EXE Blocking) · Storage Reports"
)

=== 10.1 Enterprise File Sharing Architecture & SMB 3.1.1 Protocol
In any corporate enterprise, employees rely heavily on continuous collaboration with files (Word documents, spreadsheets, PDFs, project code). If employees keep critical company data solely on local client laptops, theft, loss, or hardware failure will result in catastrophic data destruction.

#mark-yellow[A File Server is a centralized server that securely hosts shared data for enterprise departments (HR, Accounts, Legal) across the network and provides authenticated access via the Server Message Block (SMB) protocol.]

In Windows Server 2025, enterprise file sharing is powered by #hl-green[SMB 3.1.1]:
- Default Port: #hl-green[TCP Port 445]
- #text(weight: "bold", fill: rtech-navy)[SMB Signing:] Mandatory by default in Windows Server 2025, neutralizing man-in-the-middle (MitM) relay attacks.
- #text(weight: "bold", fill: rtech-navy)[SMB Encryption:] End-to-end AES-256-GCM encryption safeguarding sensitive transit data against eavesdropping and packet sniffing.

#v(4pt)

=== 10.2 Share Permissions vs. NTFS Permissions
This is one of the most critical foundational topics in Windows enterprise infrastructure:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ntfs_vs_share_matrix.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 10.1: Share Permissions vs. NTFS Permissions — Effective Permission Formula & Most Restrictive Rule]
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "Share Permissions")[
      - Enforced strictly when a user connects across the network via UNC path (`\\Server\Share`).
      - Ineffective if a user logs on interactively or locally to the host server console.
      - Provides only 3 coarse tiers: #hl-yellow[Read], #hl-green[Change], and #hl-orange[Full Control].
    ]
  ],
  [
    #info-box(title: "NTFS Security Permissions")[
      - Enforced 100% across both local console and network-based UNC path access.
      - Requires volumes formatted with the NTFS file system.
      - Highly granular tiers: #hl-yellow[Read], #hl-green[Write], #hl-orange[Modify], #hl-green[Read & Execute], and #hl-orange[Full Control].
    ]
  ]
)

#v(6pt)

=== 10.3 Effective Permissions: The Most Restrictive Rule
When a user attempts to access a shared file or folder over the network, Windows evaluates both the configured Share permissions and the underlying NTFS permissions simultaneously:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[The Golden Law of Effective Permissions:]\
    #align(center)[#text(size: 9.5pt, weight: "black", fill: rtech-navy)[
      Effective Permission = Most Restrictive (Share Permission, NTFS Permission)
    ]]\
    #text(size: 7.5pt, fill: rtech-text)[
      - *Example 1:* If Share Permission = #hl-green[Read] and NTFS Permission = #hl-green[Full Control], the resulting effective permission is strictly #mark-yellow[Read] (the user cannot modify or save changes)!
      - *Example 2:* If Share Permission = #hl-green[Full Control] and NTFS Permission = #hl-green[Modify], the resulting effective permission is #mark-green[Modify]!
      - #text(weight: "bold", fill: rtech-blue)[Enterprise Best Practice:] Leave Share Permissions broadly open as `Authenticated Users = Change` (or `Full Control`), and govern all fine-grained security boundaries exclusively via *NTFS ACLs*!
    ]
  ]
)

#v(6pt)

=== 10.4 Installing the File Server Resource Manager (FSRM) Role
FSRM is Microsoft's advanced storage management toolset that enables administrators to classify data, restrict storage consumption, and prevent unauthorized file types from clogging corporate volumes:

1. Open Server Manager -> Navigate to #hl-green[Add Roles and Features].
2. Under Server Roles -> Expand #text(weight: "bold")[File and Storage Services] -> Expand #text(weight: "bold")[File and iSCSI Services].
3. Check the box for #mark-yellow[File Server Resource Manager].
4. Select 'Add Features' to include the RSAT management tools, then click 'Install'.
5. Once installation finishes, open #hl-green[File Server Resource Manager] from the Tools menu (or execute: #mark-green[`fsrm.msc`] in the Run dialog).

#v(6pt)

=== 10.5 Storage Quota Management: Hard Quotas vs. Soft Quotas
Without proactive storage quota controls, individual users can hoard hundreds of gigabytes of non-work personal data, completely exhausting shared server storage:

- #text(weight: "bold", fill: rtech-rose)[Hard Quota:] Enforces a strict, unyielding ceiling. The moment a user's consumed space reaches 100% of the assigned threshold (e.g., 10 GB), Windows immediately denies all write attempts, returning a 'There is not enough space on the disk' error.
- #text(weight: "bold", fill: rtech-amber)[Soft Quota:] Acts as an advisory monitoring threshold. When consumption hits 100%, write operations continue unimpeded, but the system logs event notifications and emails alerts to the administrator and the user for capacity planning.

*Quota Configuration Steps:*
1. Inside `fsrm.msc`, expand #hl-yellow[Quota Management -> Quotas] in the left pane.
2. In the right Actions pane, click 'Create Quota...'.
3. Quota path: Browse to your shared directory (e.g., `C:\Shares\HR_Data`).
4. Under 'Derive properties from this quota template': Select #hl-green['10 GB Limit (Hard Quota)'].
5. Notification Thresholds: Check automatic email notifications at 85% and 95% utilization thresholds. Click 'Create'.

#v(6pt)

=== 10.6 File Screening: Blocking Audio, Video, and Unapproved Payloads
Employees frequently attempt to store media libraries, movies, songs (`.mp3`, `.mp4`), or executable binaries on corporate storage. File Screening blocks unauthorized extensions in real time:

1. Open the FSRM console: Navigate to #hl-yellow[File Screening Management -> File Screens].
2. Click 'Create File Screen...' in the Actions pane.
3. File screen path: Specify `C:\Shares\`.
4. Select the 'Block Audio and Video Files' template (which defines patterns such as `*.mp3`, `*.mp4`, `*.avi`, `*.mkv`, and `*.wav`).
5. Under Screening Type, choose #mark-yellow[Active screening: Do not allow users to save unauthorized files].
6. Click 'Create'. When a user now attempts to drag or copy an unauthorized audio or video file into the folder, Windows instantly denies the operation with an #hl-orange['Access is Denied'] prompt!

#v(6pt)

=== 10.7 Automated Storage Usage Reports (Storage Reports Management)
FSRM provides automated scheduling to generate and email comprehensive storage audit reports to systems administrators:
- #text(weight: "bold")[Duplicate Files Report:] Scans disk volumes for redundant identical files, reclaiming significant disk space.
- #text(weight: "bold")[Large Files Report:] Identifies all files exceeding a specified threshold (e.g., files greater than 500 MB).
- #text(weight: "bold")[Least Recently Accessed Files:] Catalogs dormant files untouched for over a year (ideal candidates for archival or tiering).

#v(8pt)

// =============================================================================
// CHAPTER 10 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows Server includes a powerful feature called #hl-yellow[Volume Shadow Copies (VSS / Previous Versions)]. If an employee accidentally overwrites or deletes an Excel spreadsheet after hours of work, administrators do not need to retrieve backup tapes! The user simply right-clicks the parent folder or file, selects #hl-green['Restore previous versions'], and autonomously restores the 9:00 AM snapshot without any helpdesk assistance!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 10 Practice Multiple-Choice Questions (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "If a shared folder has a Share Permission of 'Read' and an NTFS Permission of 'Full Control', what is the resulting Effective Permission for a network user?",
  optA: "Full Control",
  optB: "Modify",
  optC: "Read",
  optD: "Write Only",
  ans: "C",
  exp: "The effective permission rule states that between Share and NTFS permissions, the Most Restrictive permission wins."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "In FSRM, which quota type strictly blocks users from saving further files once the allocated storage threshold is reached?",
  optA: "Soft Quota",
  optB: "Hard Quota",
  optC: "Dynamic Quota",
  optD: "Elastic Quota",
  ans: "B",
  exp: "A Hard Quota halts write operations 100% and triggers a 'Disk is full' error upon reaching the designated limit."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "Which FSRM feature is utilized to prevent employees from storing unauthorized MP3 music and MP4 video files in corporate shared folders?",
  optA: "Storage Spaces",
  optB: "File Screening Management",
  optC: "DNS Scavenging",
  optD: "Shadow Copies",
  ans: "B",
  exp: "File Screening blocks unauthorized file extensions (.mp3, .mp4, .exe) from being written to the storage system."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "What is the official Microsoft run command to launch the File Server Resource Manager console directly?",
  optA: "diskmgmt.msc",
  optB: "fsrm.msc",
  optC: "storagemgmt.msc",
  optD: "fsmgmt.msc",
  ans: "B",
  exp: "fsrm.msc directly launches the File Server Resource Manager management console."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "On which standard network port does SMB 3.1.1 file sharing operate by default in Windows Server 2025?",
  optA: "TCP Port 80",
  optB: "TCP Port 445",
  optC: "TCP Port 3389",
  optD: "UDP Port 53",
  ans: "B",
  exp: "SMB (Server Message Block) operates officially over TCP Port 445."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Questions (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'Between Share Permissions and NTFS Permissions, which is more powerful, and what is Microsoft's official production recommendation?'",
  a: "Answer: For network access, Windows enforces the 'Most Restrictive' rule between Share and NTFS permissions. However, for local interactive access, only NTFS permissions apply. Microsoft's official best practice is to keep Share Permissions broadly open (e.g., 'Authenticated Users = Change' or 'Full Control'), and govern all granular access control strictly through NTFS Access Control Lists (ACLs) because NTFS supports inheritance, ownership, auditing, and 13 fine-grained permission attributes.",
  tip: "A classic infrastructure interview question regularly featured at Capgemini, Infosys, and TCS."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'What is the exact distinction between 'Modify' and 'Write' permissions in NTFS?'",
  a: "Answer: 'Write' permission grants the right to create new files and append data to existing files, but does NOT grant permission to delete files. 'Modify' permission encompasses Read, Write, and Execute, while explicitly granting the authority to delete files and subdirectories.",
  tip: "A subtle distinction that many candidates miss; knowing this exact nuance demonstrates deep systems understanding."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'What is the operational difference between Active Screening and Passive Screening in FSRM?'",
  a: "Answer: Active Screening immediately blocks the user from saving an unapproved file extension (returning an Access Denied error) and generates an administrative alert. Passive Screening permits the user to write the file without disruption, but logs an event and sends an alert email so administrators can audit unauthorized storage usage discreetly.",
  tip: "A staple question in enterprise storage administration and compliance engineering interviews."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'What is Volume Shadow Copies (VSS), and how much disk space does it allocate by default?'",
  a: "Answer: VSS captures point-in-time, block-level delta snapshots of a volume. Instead of duplicating entire files, it preserves only changed blocks within 'System Volume Information'. By default, it reserves up to 10% of the volume capacity and enables self-service user recovery via the 'Previous Versions' tab.",
  tip: "A core interview topic for storage disaster recovery and backup administrator roles."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "Interviewer: 'What is Access-Based Enumeration (ABE), and why is it beneficial in enterprise file sharing?'",
  a: "Answer: ABE is an intelligent Windows file sharing capability. When enabled, users can only see shared folders and files for which they have at least Read permission. Folders for which the user lacks permissions are completely hidden from view. This prevents user curiosity and reduces 'Access Denied' helpdesk support tickets by up to 90%.",
  tip: "Tested in senior system administration rounds to verify real-world user experience optimization skills."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 10 Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - Effective permissions adhere to the 'Most Restrictive' rule; assign broad Share permissions and control security via NTFS ACLs.
      - FSRM Hard Quotas prevent volume exhaustion, while File Screening blocks unauthorized non-business media (MP3/MP4).
      - VSS Shadow Copies and Access-Based Enumeration (ABE) dramatically enhance file server resiliency and user satisfaction.
    ]
  ]
)

#pagebreak()
