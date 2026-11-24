// =============================================================================
// CHAPTER 05: ADUC CONSOLE: OUS, DOMAIN USERS & GROUP MANAGEMENT
// =============================================================================

[#metadata("ch5") <chapter-5>]

#chapter-header(
  chapter-num: "CHAPTER 05",
  category: "Part 5: Directory Objects & Access Control (Directory Objects & RBAC)",
  title: "ADUC Console: Managing OUs, Domain Users & Security Groups",
  subtitle: "ADUC (dsa.msc) · Enterprise OU Hierarchy · Domain User Accounts · Password & Lockout Policies · Security vs. Distribution Groups · AGDLP Model · Bulk PowerShell"
)

=== 5.1 Active Directory Users and Computers (`dsa.msc`) Interface
Following the promotion of a Domain Controller, the primary graphical administrative tool used to manage all Active Directory objects (Users, Computers, Groups, and OUs) is #hl-yellow[Active Directory Users and Computers (ADUC)].

*Two Quick Ways to Open the ADUC Console:*
1. In Server Manager -> click the #hl-green[Tools] menu in the top-right corner -> select #hl-yellow[Active Directory Users and Computers].
2. In the Run dialog (`Win + R`), enter the shortcut command: #mark-green[`dsa.msc`] and press Enter.

In the left navigation tree, your domain `#text(weight: "bold")[corp.rtechlab.local]` is displayed. Underneath it, several default containers exist out-of-the-box:
- #text(weight: "bold", fill: rtech-navy)[Builtin:] Built-in system security groups (Administrators, Account Operators, Backup Operators, etc.).
- #text(weight: "bold", fill: rtech-navy)[Computers:] Default landing container where standard client workstation computer accounts are placed upon joining the domain.
- #text(weight: "bold", fill: rtech-navy)[Domain Controllers:] Dedicated OU containing computer accounts for all authorized Domain Controllers in this domain.
- #text(weight: "bold", fill: rtech-navy)[Users:] Default domain user accounts and groups (e.g., Administrator, Guest, Domain Admins, Domain Users).

#warning-box(title: "Default Container vs. Organizational Unit (Critical Architectural Difference)")[
  'Computers' and 'Users' are generic containers, NOT Organizational Units (OUs)! #hl-orange[Group Policy Objects (GPOs) cannot be linked directly to default generic containers.] Consequently, enterprise production environments never leave employee accounts or endpoints in default containers; custom OUs must always be established.
]

#v(2pt)

=== 5.2 Enterprise OU Hierarchy Design
A well-structured OU layout streamlines corporate administration, delegation, and security policy enforcement:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ou_hierarchy_agdlp.png", width: 65%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 5.1: Enterprise OU Structure and AGDLP Role-Based Access Control (RBAC) Nesting Framework]
]

#v(2pt)

*Steps to Create a Custom OU Hierarchy:*
1. In ADUC, right-click the domain root `#text(weight: "bold")[corp.rtechlab.local]` -> select #hl-yellow[New -> Organizational Unit].
2. In the Name field, enter: #hl-green[`RTechLab-Enterprise`].
3. Ensure the #mark-orange['Protect container from accidental deletion'] checkbox remains enabled. This safeguard prevents administrators from accidentally deleting the OU tree. Click 'OK'.
4. Next, right-click `RTechLab-Enterprise` to create operational sub-OUs:
   - #hl-yellow[`Corporate-Departments`] (housing child OUs: `HR`, `Finance`, `IT-Admins`, and `Sales`)
   - #hl-yellow[`Workstations`] (for employee Windows 10/11 desktop and laptop endpoints)
   - #hl-yellow[`Servers`] (for member servers including File Servers and Web Servers)

#v(1.5pt)

=== 5.3 Creating Domain User Accounts
We will now provision a new domain user account for the HR Department:

1. Right-click the `Corporate-Departments -> HR` OU -> select #hl-yellow[New -> User].
2. #text(weight: "bold")[First name:] `Rahul`, #text(weight: "bold")[Last name:] `Patel`.
3. #text(weight: "bold")[User logon name (UPN):] #hl-green[`rpatel`]\@corp.rtechlab.local.
4. #text(weight: "bold")[User logon name (pre-Windows 2000):] `CORP\rpatel` (automatically populated). Click 'Next'.
5. #text(weight: "bold")[Password Configuration & 4 Critical Flags:]
   - #text(weight: "bold", fill: rtech-blue)[✓ User must change password at next logon:] (Corporate best practice — mandates the employee to establish their own private password upon initial interactive logon).
   - #text(weight: "bold", fill: rtech-muted)[User cannot change password:] (Ideal for shared kiosk or digital signage service accounts).
   - #text(weight: "bold", fill: rtech-rose)[Password never expires:] (Restricted strictly to automated service accounts; assigning this to interactive users is a severe security violation).
   - #text(weight: "bold", fill: rtech-amber)[Account is disabled:] (Used during employee onboarding prior to start date, or during leave/notice periods).
6. Enter an initial complex password (e.g., #hl-green[`Welcome@2025#`]) and click 'Next' -> 'Finish'.

#v(1.5pt)

=== 5.4 Account Lockout & Fine-Grained Password Policies (FGPP)
To mitigate online brute-force credential stuffing and password-guessing attacks, Active Directory provides automated account lockout protection:
- If a user or adversary enters an incorrect password 5 consecutive times (Account lockout threshold), the account is locked automatically for 30 minutes.
- *Unlocking an Account Manually:* In ADUC, right-click the user account -> select #hl-yellow[Properties -> Account] tab. Check the box #hl-green['Unlock account. This account is currently locked out on this Active Directory Domain Controller'] and click 'Apply'.

#v(1.5pt)

=== 5.5 Security Groups vs. Distribution Groups
Active Directory supports two functional group types:
1. #text(weight: "bold", fill: rtech-navy)[Security Groups:] Designed primarily to assign access permissions on network resources (shared folders, printers, SharePoint). They can also be mail-enabled for message delivery.
2. #text(weight: "bold", fill: rtech-navy)[Distribution Groups:] Used solely for email distribution lists (Exchange Server / Outlook). #hl-orange[Distribution groups cannot be assigned NTFS permissions or added to resource Access Control Lists (ACLs)!]

#v(1.5pt)

=== 5.6 Group Scopes and the AGDLP Best Practice
Microsoft strongly recommends adhering to the industry-standard #hl-yellow[AGDLP Model] for managing role-based permissions:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 6pt, y: 4pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[The AGDLP Formula (Core MNC Architecture & Interview Principle):]\
    - #text(weight: "bold", fill: rtech-blue)[A (Accounts):] User accounts (e.g., `rpatel`, `ajain`).
    - #text(weight: "bold", fill: rtech-blue)[G (Global Groups):] Aggregate user accounts into Global Groups representing business roles or departments (e.g., `GG_HR_Staff`).
    - #text(weight: "bold", fill: rtech-amber)[DL (Domain Local Groups):] Create Domain Local Groups defining specific resource access entitlements, and nest Global Groups into them (e.g., `DL_HR_Payroll_Read`).
    - #text(weight: "bold", fill: rtech-emerald)[P (Permissions):] Assign NTFS and Share permissions exclusively to Domain Local Groups on target resources (Shared Folders)!
  ]
)

#v(1.5pt)

=== 5.7 Automated Bulk User Onboarding with PowerShell
When 200 new team members join simultaneously in production environments, manual creation in the ADUC GUI is inefficient. Enterprise administrators automate onboarding with PowerShell:

```powershell
# Single User Provisioning:
New-ADUser -Name "Rahul Patel" -GivenName "Rahul" -Surname "Patel" `
  -SamAccountName "rpatel" -UserPrincipalName "rpatel@corp.rtechlab.local" `
  -Path "OU=HR,OU=Corporate-Departments,OU=RTechLab-Enterprise,DC=corp,DC=rtechlab,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Welcome@2025#" -AsPlainText -Force) `
  -Enabled $true -ChangePasswordAtLogon $true

# Bulk Provisioning 500 Users from a CSV File:
Import-Csv -Path "C:\HR_New_Employees.csv" | ForEach-Object {
    New-ADUser -Name "$($_.FirstName) $($_.LastName)" -SamAccountName $_.Username `
      -Path $_.OUPath -AccountPassword (ConvertTo-SecureString $_.DefaultPassword -AsPlainText -Force) `
      -Enabled $true -ChangePasswordAtLogon $true
}
```

#v(2pt)

// =============================================================================
// CHAPTER 05 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Active Directory features a background security process known as #hl-yellow[AdminSDHolder] and #hl-yellow[SDProp (Security Descriptor Propagator)]. Every 60 minutes, the PDC Emulator resets security permissions and disables inheritance on all members of protected administrative groups (Domain Admins, Enterprise Admins, Schema Admins) to prevent unauthorized permission modifications by junior administrators!
]

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 05 Practice Multiple Choice Questions (Practice MCQs)]
#v(1.5pt)

#mcq-item(
  num: "1",
  q: "What is the official Run shortcut command used to launch the Active Directory Users and Computers console directly?",
  optA: "gpmc.msc",
  optB: "dsa.msc",
  optC: "dnsmgmt.msc",
  optD: "compmgmt.msc",
  ans: "B",
  exp: "dsa.msc (Directory Services Administration) is the standard Microsoft management shortcut for the ADUC console."
)

#v(1.5pt)

#mcq-item(
  num: "2",
  q: "Why can Group Policy Objects (GPOs) NOT be linked directly to the default 'Users' and 'Computers' containers?",
  optA: "They are password-protected",
  optB: "They are generic containers, not Organizational Units (OUs)",
  optC: "They require enterprise CAL licensing",
  optD: "They are strictly read-only",
  ans: "B",
  exp: "Group Policy Objects can only be linked directly to Sites, Domains, and Organizational Units (OUs), not to default generic containers."
)

#v(1.5pt)

#mcq-item(
  num: "3",
  q: "What does the acronym 'DL' represent in Microsoft's recommended AGDLP access control framework?",
  optA: "Distribution List",
  optB: "Domain Local Group",
  optC: "Dynamic Link",
  optD: "Data Lock",
  ans: "B",
  exp: "The AGDLP architecture represents: Accounts -> Global Groups -> Domain Local Groups -> Permissions."
)

#v(1.5pt)

#mcq-item(
  num: "4",
  q: "What is the primary corporate security benefit of enabling 'User must change password at next logon' during user creation?",
  optA: "Administrators never know the permanent password, maintaining non-repudiation and individual accountability",
  optB: "Password complexity requirements are eliminated",
  optC: "The user account is permanently protected against lockout",
  optD: "The user automatically acquires Domain Admin privileges",
  ans: "A",
  exp: "Mandating a password change upon first interactive login ensures that the employee is the sole custodian of their credentials."
)

#v(1.5pt)

#mcq-item(
  num: "5",
  q: "Which official Active Directory PowerShell cmdlet is used to create a new domain user account?",
  optA: "Add-User",
  optB: "Create-ADAccount",
  optC: "New-ADUser",
  optD: "Set-DomainUser",
  ans: "C",
  exp: "New-ADUser is the official cmdlet provided by the ActiveDirectory PowerShell module for user provisioning."
)

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Questions (High-Yield Interview Vault)]
#v(1.5pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'What is the fundamental difference between Security Groups and Distribution Groups, and can we assign NTFS permissions to a Distribution Group?'",
  a: "Answer: No, Distribution Groups can never be assigned Share or NTFS permissions because they lack a security context (SID - Security Identifier); they exist exclusively for Exchange and Outlook email distribution. Only Security Groups possess a security SID, enabling them to be placed within resource Access Control Lists (ACLs) to grant access.",
  tip: "This core question appears routinely in L1 and L2 enterprise technical support interviews at TCS, Cognizant, and Wipro."
)

#v(1.5pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'Why is the AGDLP nesting framework recommended? Why not assign folder permissions directly to user accounts?'",
  a: "Answer: Assigning permissions directly to user accounts (Discretionary Access Control) leads to administrative paralysis in enterprise environments. When employees transition between roles or leave the company, auditing and revoking direct permissions is nearly impossible. Under AGDLP, permissions are granted solely to Domain Local groups. When staffing changes occur, administrators only modify Global group memberships without ever modifying resource ACLs.",
  tip: "This answer demonstrates comprehensive enterprise architecture expertise."
)

#v(1.5pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'A user account is locked out. How can you unlock it in 2 seconds via PowerShell without launching the ADUC GUI?'",
  a: "Answer: Execute the command: 'Unlock-ADAccount -Identity rpatel'. This instantly unlocks the account on the PDC Emulator without graphical overhead.",
  tip: "Demonstrating proficiency in command-line automation immediately distinguishes you from entry-level candidates."
)

#v(1.5pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'How does the 'Protect container from accidental deletion' checkbox on an OU work under the hood?'",
  a: "Answer: When checked, Active Directory injects explicit 'Deny Delete' and 'Deny Delete Subtree' Access Control Entries (ACEs) for 'Everyone' and 'Domain Admins' into the OU's security descriptor. Any deletion attempt immediately triggers an 'Access Denied' error. To delete it legitimately, an administrator must enable View -> Advanced Features and uncheck the protection on the Object tab.",
  tip: "Understanding directory security internals is highly regarded in senior Active Directory engineering interviews."
)

#v(1.5pt)

#interview-item(
  num: "5",
  q: "Interviewer: 'What are Fine-Grained Password Policies (FGPP), and how do they differ from the Default Domain Policy?'",
  a: "Answer: In legacy Windows Server designs, only a single password policy (Default Domain Policy) could be enforced across an entire domain. FGPP (implemented via Password Settings Objects - PSOs) allows administrators to assign distinct password and lockout rules to different OUs or security groups (e.g., standard 8-character passwords for general staff, but mandatory 16-character complex passwords and 15-day rotation for IT Admins).",
  tip: "This question is central to enterprise compliance audits and privileged access management (PAM)."
)

#v(2pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 05 Key Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - OUs provide logical structure for directory assets and serve as the granular target boundary for Group Policy linking.
      - Always enforce the AGDLP nesting standard for resource authorization; never grant direct access permissions to individual user accounts.
      - PowerShell cmdlets `New-ADUser` and `Unlock-ADAccount` accelerate enterprise helpdesk operations by tenfold.
    ]
  ]
)

#pagebreak()
