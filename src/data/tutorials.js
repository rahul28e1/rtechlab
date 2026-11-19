import { cluster1Articles } from './articles/cluster1.js';

const existingLabs = [
  {
    id: "ospf-single-area-packet-tracer",
    title: "Configuring Single-Area OSPFv2 on Cisco IOS",
    titleHi: "सिस्को IOS पर सिंगल-एरिया OSPFv2 को कॉन्फ़िगर करना",
    category: "CCNA & Networking",
    readTime: "8 min",
    difficulty: "Intermediate",
    difficultyHi: "मध्यवर्ती",
    summary: "Step-by-step practical lab configuring Open Shortest Path First (OSPF) on two interconnected Cisco routers with network statements, wildcard masks, and loopback verification.",
    summaryHi: "दो सिस्को राउटर्स पर वाइल्डकार्ड मास्क और लूपबैक वेरिफिकेशन के साथ OSPFv2 कॉन्फ़िगर करने की चरण-दर-चरण प्रैक्टिकल गाइड।",
    badge: "CCNA 200-301 Core",
    topology: "Router-01 (192.168.12.1/30) <---> Router-02 (192.168.12.2/30)",
    prerequisites: "Basic Cisco IOS CLI privilege levels and IPv4 addressing knowledge.",
    objectives: [
      "Enable OSPF routing process ID 1 on Cisco routers",
      "Advertise connected subnets with appropriate wildcard masks",
      "Verify OSPF neighbor adjacency state (FULL/BDR or 2-WAY)",
      "Test end-to-end ICMP ping across the routed network"
    ],
    contentMarkdown: `
### Lab Scenario Overview
In this lab, you configure **OSPF Process 1** in Area 0 (Backbone Area) between two routers: \`R1\` and \`R2\`.

\`\`\`
[ R1 ] ---- FastEthernet0/0: 192.168.12.1/30 ---- [ R2 ]
Loopback 0: 10.1.1.1/24                          Loopback 0: 10.2.2.1/24
\`\`\`

---

### Step 1: Configure Interfaces on Router 1
Enter privileged EXEC mode and assign IP addresses:

\`\`\`bash
R1# configure terminal
R1(config)# interface FastEthernet0/0
R1(config-if)# ip address 192.168.12.1 255.255.255.252
R1(config-if)# no shutdown
R1(config-if)# exit

R1(config)# interface Loopback0
R1(config-if)# ip address 10.1.1.1 255.255.255.0
R1(config-if)# exit
\`\`\`

---

### Step 2: Configure Interfaces on Router 2
\`\`\`bash
R2# configure terminal
R2(config)# interface FastEthernet0/0
R2(config-if)# ip address 192.168.12.2 255.255.255.252
R2(config-if)# no shutdown
R2(config-if)# exit

R2(config)# interface Loopback0
R2(config-if)# ip address 10.2.2.1 255.255.255.0
R2(config-if)# exit
\`\`\`

---

### Step 3: Enable OSPFv2 Process on R1 and R2
Using Area 0 (Backbone) with wildcard masks:

\`\`\`bash
R1(config)# router ospf 1
R1(config-router)# router-id 1.1.1.1
R1(config-router)# network 192.168.12.0 0.0.0.3 area 0
R1(config-router)# network 10.1.1.0 0.0.0.255 area 0
R1(config-router)# exit
\`\`\`

On Router 2:
\`\`\`bash
R2(config)# router ospf 1
R2(config-router)# router-id 2.2.2.2
R2(config-router)# network 192.168.12.0 0.0.0.3 area 0
R2(config-router)# network 10.2.2.0 0.0.0.255 area 0
R2(config-router)# exit
\`\`\`

---

### Step 4: Verification Commands
Execute these verification commands on \`R1\`:

\`\`\`bash
R1# show ip ospf neighbor
# Look for State: FULL/DR or FULL/BDR

R1# show ip route ospf
# You should see: O  10.2.2.0/24 [110/2] via 192.168.12.2

R1# ping 10.2.2.1 source loopback 0
# Success rate is 100 percent (5/5)
\`\`\`

> **Key Exam Tip**: OSPF requires matching Area IDs, Hello/Dead timers, subnet masks, and MTU size to form neighbor adjacency!
`
  },
  {
    id: "linux-file-permissions-acl",
    title: "Mastering Linux File Permissions (chmod, chown & ACLs)",
    titleHi: "लिनक्स फ़ाइल अनुमतियाँ और ACLs में महारत हासिल करना",
    category: "Linux Systems",
    readTime: "7 min",
    difficulty: "Beginner to Intermediate",
    difficultyHi: "शुरुआती से मध्यवर्ती",
    summary: "Understand the numeric (octal) and symbolic representations of Linux permissions, sticky bits, SUID/SGID, and fine-grained POSIX Access Control Lists.",
    summaryHi: "लिनक्स अनुमतियों (चमोड, चॉउन), स्टिकी बिट, SUID/SGID और उन्नत एक्सेस कंट्रोल लिस्ट (getfacl/setfacl) की व्यावहारिक समझ।",
    badge: "LPIC & CompTIA Linux+",
    topology: "Ubuntu Server 24.04 / Rocky Linux CLI",
    prerequisites: "Access to any standard Linux terminal or bash shell.",
    objectives: [
      "Decode the 10-character Linux ls -l output string",
      "Calculate 3-digit octal permissions (r=4, w=2, x=1)",
      "Manage file ownership with chown and chgrp",
      "Set multi-user specific access using getfacl and setfacl"
    ],
    contentMarkdown: `
### Anatomy of Linux Permission String
When running \`ls -l\`, each file shows 10 characters:

\`\`\`text
- rwx r-x r--  1 student devops  4096 Nov 10 09:00 deploy.sh
│ └─┬─┘ └─┬─┘ └─┬─┘
│   │     │     └── Other (World): Read-only (4)
│   │     └──────── Group: Read + Execute (5)
│   └────────────── User (Owner): Read + Write + Execute (7)
└────────────────── File type (- = regular file, d = directory)
\`\`\`

---

### Octal Calculation Table
- **Read (r)** = \`4\`
- **Write (w)** = \`2\`
- **Execute (x)** = \`1\`

\`\`\`bash
# 755 = Owner (4+2+1=7), Group (4+0+1=5), Others (4+0+1=5)
chmod 755 deploy.sh

# 644 = Owner (4+2=6), Group (4), Others (4) - Standard web assets
chmod 644 index.html

# 600 = Owner (4+2=6), Group (0), Others (0) - Private SSH Keys
chmod 600 ~/.ssh/id_ed25519
\`\`\`

---

### Ownership Commands
\`\`\`bash
# Change owner to student
chown student deploy.sh

# Change owner and group simultaneously
chown student:developers /opt/webapp

# Recursive ownership change for all nested directories
chown -R www-data:www-data /var/www/html
\`\`\`

---

### Setting POSIX Access Control Lists (ACLs)
Standard permissions only allow 1 user and 1 group. For granular permissions:

\`\`\`bash
# Grant user 'rahul' read/write access to audit.log without changing owner
setfacl -m u:rahul:rw /var/log/audit.log

# Check active ACLs
getfacl /var/log/audit.log

# Remove all extended ACLs
setfacl -b /var/log/audit.log
\`\`\`
`
  },
  {
    id: "homelab-virtualbox-cybersecurity",
    title: "Building an Isolated Cyber Security Homelab with VirtualBox",
    titleHi: "VirtualBox के साथ एक सुरक्षित साइबर सुरक्षा होमलैब का निर्माण",
    category: "Cyber Security",
    readTime: "10 min",
    difficulty: "Hands-on Practical",
    difficultyHi: "हैंड्स-ऑन प्रैक्टिकल",
    summary: "Architect a safe, isolated host-only and internal network for Kali Linux and a vulnerable target VM (Metasploitable2 / Debian) on your existing PC.",
    summaryHi: "अपने मौजूदा पीसी पर काली लिनक्स और एक टार्गेट मशीन के साथ पूरी तरह से सुरक्षित और अलग नेटवर्क लैब तैयार करें।",
    badge: "SOC & Defense Lab",
    topology: "Host PC ---> VirtualBox Internal Network [Kali 10.0.5.10] <---> [Target 10.0.5.20]",
    prerequisites: "PC with minimum 8GB RAM, 50GB free SSD space, and hardware virtualization enabled in BIOS.",
    objectives: [
      "Configure VirtualBox Internal Network adapters to prevent WAN leakage",
      "Assign static IP addressing across the isolated subnet",
      "Perform passive network discovery using arp-scan and nmap",
      "Capture packets with Wireshark to observe handshake mechanics"
    ],
    contentMarkdown: `
### Architecture Safety Rule #1
> **Never** connect a vulnerable practice target VM to **Bridged Adapter** on your home or office Wi-Fi network!
> Always use **Internal Network** or **Host-Only Adapter** so traffic cannot reach outside devices.

---

### Step 1: VirtualBox Network Configuration
1. Open **VirtualBox** > Select **Kali VM** > **Settings** > **Network**.
2. **Adapter 1**: Set to \`Internal Network\`, Name: \`RTechLab-Isolated\`.
3. Select **Target VM** > **Settings** > **Network**.
4. **Adapter 1**: Set to \`Internal Network\`, Name: \`RTechLab-Isolated\`.

---

### Step 2: Configure Static IP on Kali Machine
In Kali terminal:
\`\`\`bash
sudo ip addr add 10.0.5.10/24 dev eth0
sudo ip link set eth0 up
ip a show eth0
\`\`\`

---

### Step 3: Discovery & Port Reconnaissance
Discover devices on the isolated segment without touching the Internet:

\`\`\`bash
# Discover live hosts via Layer 2 ARP
sudo arp-scan --interface=eth0 10.0.5.0/24

# Perform a focused TCP SYN scan against the target
sudo nmap -sS -p- -T4 10.0.5.20

# Run service version detection and default safe scripts
sudo nmap -sV -sC -p 21,22,80,443 10.0.5.20
\`\`\`

---

### Step 4: Wireshark Packet Inspection
Open Wireshark and listen on interface \`eth0\`:
1. Filter for \`tcp.flags.syn == 1 && tcp.flags.ack == 0\` to view TCP SYN initiation.
2. Filter for \`icmp\` to see Echo Request (Type 8) and Echo Reply (Type 0).
`
  },
  {
    id: "subnetting-vlsm-cheatsheet-guide",
    title: "Understanding CIDR, Subnetting & VLSM Without Confusion",
    titleHi: "बिना किसी भ्रम के CIDR, सबनेटिंग और VLSM को समझना",
    category: "Networking & CCNA",
    readTime: "9 min",
    difficulty: "Foundational",
    difficultyHi: "बुनियादी",
    summary: "Clear mental models to calculate network addresses, broadcast addresses, usable hosts, and wildcard masks in under 15 seconds.",
    summaryHi: "15 सेकंड के भीतर नेटवर्क एड्रेस, ब्रॉडकास्ट एड्रेस और वाइल्डकार्ड मास्क की गणना करने का आसान तरीका।",
    badge: "High Yield Exam Topic",
    topology: "Classless Inter-Domain Routing (CIDR) /24 to /30",
    prerequisites: "Basic arithmetic and concept of IP addresses as 32-bit binary strings.",
    objectives: [
      "Convert CIDR prefixes (/24, /26, /27, /30) to subnet masks",
      "Calculate the 'Magic Number' (block size) instantly",
      "Determine valid host range and broadcast address",
      "Create efficient VLSM allocations for WAN point-to-point links"
    ],
    contentMarkdown: `
### The 32-Bit Structure
An IPv4 address contains four octets of 8 bits each (Total = 32 bits).
A subnet mask divides these bits into two portions:
1. **Network Bits** (1s in mask)
2. **Host Bits** (0s in mask)

---

### The Magic Number Formula
The "Magic Number" is simply:
$$\\text{Block Size} = 256 - \\text{Interesting Octet Subnet Mask}$$

Example for **/26** (Mask: \`255.255.255.192\`):
- Interesting Octet is the 4th octet: \`192\`
- **Block Size** = $256 - 192 = 64$
- The networks increment by 64:
  - Subnet 1: \`192.168.1.0\`
  - Subnet 2: \`192.168.1.64\`
  - Subnet 3: \`192.168.1.128\`
  - Subnet 4: \`192.168.1.192\`

---

### Quick Reference Table
| CIDR | Subnet Mask | Block Size | Total Hosts | Usable Hosts ($2^H - 2$) | Typical Use Case |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **/24** | 255.255.255.0 | 256 | 256 | 254 | Standard Department LAN |
| **/26** | 255.255.255.192 | 64 | 64 | 62 | Mid-sized Branch Office |
| **/27** | 255.255.255.224 | 32 | 32 | 30 | Server Subnet / Management |
| **/28** | 255.255.255.240 | 16 | 16 | 14 | Small DMZ segment |
| **/30** | 255.255.255.252 | 4 | 4 | 2 | Point-to-Point Router WAN link |
| **/32** | 255.255.255.255 | 1 | 1 | 1 | Host Route / Loopback interface |
`
  },
  {
    id: "python-network-automation-netmiko",
    title: "Python Scripting for Network Engineers with Netmiko",
    titleHi: "नेटवर्क इंजीनियर्स के लिए Netmiko के साथ पायथन ऑटोमेशन",
    category: "Coding & Automation",
    readTime: "8 min",
    difficulty: "Applied Practical",
    difficultyHi: "व्यावहारिक अनुप्रयोग",
    summary: "Write a clean Python script to automate SSH login to Cisco switches, extract running configuration, and backup device states automatically.",
    summaryHi: "सिस्को स्विचेस में स्वचालित SSH लॉगिन, कॉन्फ़िगरेशन बैकअप और शो कमांड्स चलाने के लिए पायथन स्क्रिप्ट।",
    badge: "NetDevOps Standard",
    topology: "Python Host (192.168.1.50) ---> Cisco Catalyst Switch (192.168.1.1)",
    prerequisites: "Python 3 installed and network connectivity to target device.",
    objectives: [
      "Install netmiko in a Python virtual environment",
      "Construct a device dictionary with SSH credentials",
      "Send show commands and parse standard output",
      "Save timestamped running-config files to disk"
    ],
    contentMarkdown: `
### Prerequisites Setup
Run in your local terminal:
\`\`\`bash
python3 -m venv netauto-venv
source netauto-venv/bin/activate  # On Windows: netauto-venv\\Scripts\\activate
pip install netmiko
\`\`\`

---

### Practical Automation Script
Save as \`backup_cisco.py\`:

\`\`\`python
from netmiko import ConnectHandler
import datetime

# Define target Cisco IOS device parameters
cisco_device = {
    'device_type': 'cisco_ios',
    'host': '192.168.1.1',
    'username': 'admin',
    'password': 'LabPassword123!',
    'secret': 'EnableSecret456!',
}

print(f"[*] Connecting to {cisco_device['host']}...")

try:
    # Initiate SSH connection
    net_connect = ConnectHandler(**cisco_device)
    net_connect.enable() # Enter privileged EXEC mode

    print("[+] Connected! Running 'show ip interface brief'...")
    output = net_connect.send_command('show ip interface brief')
    print(output)

    # Backup running-config
    print("[*] Backing up running-config...")
    config_backup = net_connect.send_command('show running-config')
    
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"cisco_backup_{timestamp}.txt"
    
    with open(filename, "w") as f:
        f.write(config_backup)
        
    print(f"[✓] Backup successfully saved to {filename}")
    net_connect.disconnect()

except Exception as e:
    print(f"[!] Connection failed: {e}")
\`\`\`
`
  },
  {
    id: "aws-vpc-architecture-essentials",
    title: "Designing a Secure Multi-AZ AWS VPC from Scratch",
    titleHi: "शुरुआत से एक सुरक्षित मल्टी-AZ AWS VPC डिज़ाइन करना",
    category: "Cloud Computing",
    readTime: "9 min",
    difficulty: "Intermediate",
    difficultyHi: "मध्यवर्ती",
    summary: "Architect a production-ready AWS Virtual Private Cloud with Public Subnets, Private Subnets, Internet Gateway, NAT Gateway, and Route Tables.",
    summaryHi: "पब्लिक और प्राइवेट सबनेट्स, इंटरनेट गेटवे और NAT गेटवे के साथ एक प्रोडक्शन-रेडी AWS VPC बनाएं।",
    badge: "AWS Solutions Architect",
    topology: "AWS Region: 10.0.0.0/16 [Public Subnet 10.0.1.0/24] [Private Subnet 10.0.2.0/24]",
    prerequisites: "Basic IP subnetting understanding and AWS Management Console access.",
    objectives: [
      "Carve out IPv4 CIDR blocks for VPC and multi-tier subnets",
      "Attach an Internet Gateway (IGW) for public outbound/inbound traffic",
      "Deploy a Managed NAT Gateway in the public subnet for private egress",
      "Configure explicit Route Tables ensuring database isolation"
    ],
    contentMarkdown: `
### Subnet Tiering Strategy
For high availability and compliance, separate layers:

\`\`\`
VPC: 10.0.0.0/16
├── Public Subnet AZ-1a  (10.0.1.0/24)  ---> Web Load Balancers / Bastion
├── Public Subnet AZ-1b  (10.0.2.0/24)  ---> Secondary Load Balancer
├── Private App Subnet   (10.0.10.0/24) ---> App Servers (EC2 / ECS)
└── Private Data Subnet  (10.0.20.0/24) ---> RDS PostgreSQL / MySQL Databases
\`\`\`

---

### Route Table Architecture
1. **Public Route Table**:
   - Destination \`10.0.0.0/16\` -> Target \`local\`
   - Destination \`0.0.0.0/0\` -> Target \`igw-xxxxxxxxx\` (Internet Gateway)
2. **Private Route Table**:
   - Destination \`10.0.0.0/16\` -> Target \`local\`
   - Destination \`0.0.0.0/0\` -> Target \`nat-xxxxxxxxx\` (NAT Gateway in Public subnet)

---

### Security Group vs Network ACL Comparison
- **Security Groups (SG)**: Stateful, operate at the virtual network interface (ENI) level. If inbound traffic is allowed, outbound response is automatically allowed.
- **Network ACLs (NACL)**: Stateless, operate at the subnet boundary. Inbound and Outbound rules must be explicitly defined using rule numbers.
`
  }
];

export const tutorialsData = [
  ...cluster1Articles.map(a => ({
    ...a,
    summary: a.summary || a.metaDescription,
    summaryHi: a.summaryHi || a.metaDescriptionHi
  })),
  ...existingLabs.map(l => ({
    ...l,
    metaDescription: l.metaDescription || l.summary,
    metaDescriptionHi: l.metaDescriptionHi || l.summaryHi
  }))
];
