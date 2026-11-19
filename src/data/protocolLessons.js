// Interactive protocol teaching scenarios for the Protocol Explorer tool.
// Every trace is illustrative: timestamps are synthetic, hops may be grouped,
// and nothing here captures live traffic.

export const protocolLessons = [
  {
    id: 'dns',
    name: 'DNS',
    layer: 'Application',
    summary: 'How a browser turns example.com into an IP address through a recursive resolver.',
    actors: [
      { id: 'pc', label: 'Your Laptop', sub: '192.168.1.20', type: 'pc' },
      { id: 'res', label: 'Recursive Resolver', sub: '1.1.1.1', type: 'server' },
      { id: 'root', label: 'Root Server', sub: 'a.root-servers.net', type: 'server' },
      { id: 'tld', label: 'TLD Server', sub: 'a.gtld-servers.net', type: 'server' },
      { id: 'auth', label: 'Authoritative NS', sub: 'ns1.example.com', type: 'server' },
    ],
    steps: [
      {
        from: 'pc',
        to: 'res',
        title: 'Recursive query',
        caption:
          'The stub resolver on the laptop sends one recursive query and expects the final answer. The RD flag asks the resolver to do all the walking.',
        fields: [
          { name: 'Transaction ID', value: '0x1D4C', hex: '1D 4C', note: 'Matches responses to this query' },
          { name: 'Flags', value: '0x0100 — RD set', hex: '01 00', note: 'Recursion Desired' },
          { name: 'Question', value: 'example.com IN A', note: 'Only one question in a standard query' },
          { name: 'QTYPE / QCLASS', value: 'A / IN (1 / 1)', hex: '00 01 00 01', note: 'IPv4 host address, Internet class' },
        ],
      },
      {
        from: 'res',
        to: 'root',
        title: 'Iterative query to a root server',
        caption:
          'The resolver asks a root server who is responsible for .com. Root servers delegate; they do not answer the A record themselves.',
        fields: [
          { name: 'Question', value: 'com IN NS', note: 'Iterative query, RD cleared' },
          { name: 'Destination port', value: '53', hex: '00 35', note: 'Cleartext DNS over UDP' },
        ],
      },
      {
        from: 'root',
        to: 'res',
        title: 'Referral to the .com TLD',
        caption:
          'A referral, not an answer. The authority section names the TLD nameservers and the additional section supplies their addresses so the resolver can continue.',
        fields: [
          { name: 'Flags', value: '0x8000 — QR, no AA', hex: '80 00', note: 'Response without authoritative answer' },
          { name: 'Authority', value: 'com. NS a.gtld-servers.net', note: 'Delegation point' },
          { name: 'Additional (glue)', value: '192.5.6.30', note: 'Avoids a second lookup for the NS itself' },
        ],
      },
      {
        from: 'res',
        to: 'tld',
        title: 'Ask the TLD where example.com lives',
        caption: 'Same iterative pattern one level down. The TLD refers the resolver to the domain\'s authoritative nameservers.',
        fields: [
          { name: 'Question', value: 'example.com IN NS' },
          { name: 'TTL', value: '172800 s', hex: '00 02 A3 00', note: 'Delegation caching hint' },
        ],
      },
      {
        from: 'tld',
        to: 'res',
        title: 'Referral to ns1.example.com',
        caption: 'The TLD returns the nameserver that is authoritative for this zone.',
        fields: [
          { name: 'Authority', value: 'example.com. NS ns1.example.com' },
          { name: 'Glue address', value: '203.0.113.10', note: 'In-bailiwick glue record' },
        ],
      },
      {
        from: 'res',
        to: 'auth',
        title: 'Authoritative query',
        caption: 'The resolver finally reaches the server that can answer authoritatively for the zone.',
        fields: [
          { name: 'Question', value: 'example.com IN A' },
          { name: 'Flags', value: '0x0100 — RD set', hex: '01 00', note: 'Resolver still owns the recursion' },
        ],
      },
      {
        from: 'auth',
        to: 'res',
        title: 'Authoritative answer',
        caption:
          'The AA flag marks this as authoritative. The resolver caches the record for the TTL and then answers the laptop from cache.',
        fields: [
          { name: 'Answer', value: 'example.com A 93.184.216.34', note: 'Apex address' },
          { name: 'TTL', value: '3600 s', hex: '00 00 0E 10', note: 'Cache lifetime' },
          { name: 'Flags', value: '0x8400 — QR, AA', hex: '84 00', note: 'Authoritative Answer' },
        ],
      },
    ],
  },
  {
    id: 'tcp',
    name: 'TCP',
    layer: 'Core',
    summary: 'The three-way handshake that establishes a reliable byte stream before any data is sent.',
    actors: [
      { id: 'client', label: 'Client', sub: '10.0.0.10:49152', type: 'pc' },
      { id: 'server', label: 'Server', sub: '10.0.0.20:443', type: 'server' },
    ],
    steps: [
      {
        from: 'client',
        to: 'server',
        title: 'SYN',
        caption: 'The client picks an ephemeral port and a random initial sequence number (ISN), then offers a window size.',
        fields: [
          { name: 'Source port', value: '49152', hex: 'C0 00', note: 'Ephemeral port' },
          { name: 'Destination port', value: '443', hex: '01 BB', note: 'HTTPS' },
          { name: 'Sequence number', value: '1000', hex: '00 00 03 E8', note: 'Client ISN' },
          { name: 'Flags', value: 'SYN', hex: '00 02', note: 'Synchronise sequence numbers' },
          { name: 'Window', value: '64240', hex: 'FA F0', note: 'Receive window scaled later in the session' },
        ],
      },
      {
        from: 'server',
        to: 'client',
        title: 'SYN-ACK',
        caption: 'The server acknowledges the client ISN + 1 and sends its own ISN. Both directions are now half-open.',
        fields: [
          { name: 'Sequence number', value: '5000', hex: '00 00 13 88', note: 'Server ISN' },
          { name: 'Acknowledgment', value: '1001', hex: '00 00 03 E9', note: 'Client ISN + 1' },
          { name: 'Flags', value: 'SYN + ACK', hex: '00 12', note: 'Two flags set' },
        ],
      },
      {
        from: 'client',
        to: 'server',
        title: 'ACK',
        caption:
          'The connection is ESTABLISHED. If this final ACK is lost, the server retransmits SYN-ACK until the retransmission timer expires.',
        fields: [
          { name: 'Sequence number', value: '1001', hex: '00 00 03 E9', note: 'No payload consumed yet' },
          { name: 'Acknowledgment', value: '5001', hex: '00 00 13 89', note: 'Server ISN + 1' },
          { name: 'Flags', value: 'ACK', hex: '00 10', note: 'Handshake complete' },
        ],
      },
      {
        from: 'client',
        to: 'server',
        title: 'First data segment',
        caption: 'Application data now flows. PSH asks the receiver to hand the bytes up without waiting for a full buffer.',
        fields: [
          { name: 'Flags', value: 'PSH + ACK', hex: '00 18', note: 'Push buffered data' },
          { name: 'Sequence number', value: '1001', hex: '00 00 03 E9', note: 'First data byte' },
          { name: 'Payload', value: '18 bytes — GET / HTTP/1.1', note: 'Application payload' },
        ],
      },
    ],
  },
  {
    id: 'http',
    name: 'HTTP/HTTPS',
    layer: 'Application',
    summary: 'A page load is several conversations stacked together: open the TCP connection, optionally negotiate TLS, then send the request and the response.',
    actors: [
      { id: 'client', label: 'Browser', sub: '10.0.0.10', type: 'pc' },
      { id: 'lb', label: 'Edge / Load Balancer', sub: '203.0.113.5', type: 'router' },
      { id: 'app', label: 'App Server', sub: '10.0.1.21:8080', type: 'server' },
    ],
    steps: [
      { from: 'client', to: 'lb', title: 'TCP 3-way: SYN', caption: 'Before any HTTP, TCP opens the path. The browser also picks an ephemeral port, ready to carry the request in this stream.', fields: [
        { name: 'Source port', value: '49152', hex: 'C0 00', note: 'Ephemeral client port' },
        { name: 'Destination port', value: '443', hex: '01 BB', note: 'HTTPS at the edge' },
        { name: 'Sequence number', value: '1000', hex: '00 00 03 E8', note: 'Browser ISN' },
        { name: 'Flags', value: 'SYN', hex: '00 02', note: 'Synchronise + request window scale later' },
      ] },
      { from: 'lb', to: 'client', title: 'TCP 3-way: SYN-ACK', caption: 'The edge acknowledges the browser ISN and gives its own. Both directions are now half-open.', fields: [
        { name: 'Sequence number', value: '5000', hex: '00 00 13 88', note: 'Edge ISN' },
        { name: 'Acknowledge', value: '1001', hex: '00 00 03 E9', note: 'Browser ISN + 1' },
        { name: 'Flags', value: 'SYN + ACK', hex: '00 12', note: 'Two flags set' },
      ] },
      { from: 'client', to: 'lb', title: 'TCP 3-way: ACK', caption: 'The connection is now ESTABLISHED. If this final ACK is lost, the edge retransmits SYN-ACK until the timer expires.', fields: [
        { name: 'Sequence number', value: '1001', hex: '00 00 03 E9', note: 'Still no application data' },
        { name: 'Acknowledge', value: '5001', hex: '00 00 13 89', note: 'Edge ISN + 1' },
        { name: 'Flags', value: 'ACK', hex: '00 10', note: 'Handshake complete' },
      ] },
      { from: 'client', to: 'lb', title: 'TLS 1.3: ClientHello', caption: 'If the URL uses HTTPS, the next handshake is TLS. The SNI still clearly names the host, even though the rest is encrypted.', fields: [
        { name: 'legacy_version', value: '0x0303 (TLS 1.2)', hex: '03 03', note: 'Frozen for proxy compatibility' },
        { name: 'supported_versions', value: '0x0304 (TLS 1.3)', hex: '03 04', note: 'Real version negotiation' },
        { name: 'server_name (SNI)', value: 'example.com', note: 'Sent in the clear' },
        { name: 'key_share', value: 'X25519 (32 bytes)', note: 'Ephemeral, gives forward secrecy' },
      ] },
      { from: 'lb', to: 'client', title: 'TLS 1.3: ServerHello + Finished', caption: 'From here everything is encrypted. The edge proves its identity with a certificate and the observer only sees ciphertexts and record sizes.', fields: [
        { name: 'cipher_suite', value: 'TLS_AES_128_GCM_SHA256', hex: '13 01', note: 'AEAD cipher + hash in one ID' },
        { name: 'key_share', value: 'X25519 (32 bytes)', note: 'Edge ephemeral key' },
        { name: 'Encrypted/handshake', value: 'cert + certificateVerify + Finished', note: 'All later messages are encrypted' },
      ] },
      { from: 'client', to: 'lb', title: 'Encrypted HTTP request', caption: 'The first real request now travels inside AES-GCM records. A passive observer on the path sees only byte lengths, not the URL or body.', fields: [
        { name: 'Record header', value: 'content_type = application_data', hex: '17 03 03', note: 'Encapsulated application data' },
        { name: 'Length 512', value: '02 00', note: 'Ciphertext length' },
        { name: 'Payload', value: 'AES-128-GCM ciphertext + tag', note: 'Contains the inner content type too' },
      ] },
      { from: 'app', to: 'lb', title: '200 OK (origin)', caption: 'The app server answers with status, headers and a body. The edge can compress or re-encode the response on the way out.', fields: [
        { name: 'Status line', value: 'HTTP/1.1 200 OK' },
        { name: 'Content-Type', value: 'application/json; charset=utf-8' },
        { name: 'Content-Length', value: '42', hex: '00 00 00 2A', note: 'Body size in bytes' },
        { name: 'Cache-Control', value: 'no-store', note: 'Sensitive responses must not be cached' },
      ] },
      { from: 'lb', to: 'client', title: '200 OK (edge to browser)', caption: 'The edge may compress the body, so Content-Length can differ on the way out. Header-level signals like compression or caching are still visible to a passive observer - only the URL and body stay private.', fields: [
        { name: 'Status line', value: 'HTTP/1.1 200 OK' },
        { name: 'Content-Encoding', value: 'br', note: 'Body compressed at the edge' },
        { name: 'Server-Timing', value: 'edge;dur=12, origin;dur=48', note: 'Latency breakdown' },
      ] },
    ],
  },
  {
    id: 'tls',
    name: 'TLS 1.3',
    layer: 'Security',
    summary: 'A single-round-trip TLS 1.3 handshake: certificates are encrypted and keys are agreed with ephemeral ECDHE.',
    actors: [
      { id: 'client', label: 'Client', sub: 'example.com', type: 'pc' },
      { id: 'server', label: 'Server', sub: ':443', type: 'server' },
    ],
    steps: [
      {
        from: 'client',
        to: 'server',
        title: 'ClientHello',
        caption:
          'The client offers protocol versions, cipher suites, an SNI hostname and a key share. TLS 1.3 keeps the legacy version field frozen for middlebox compatibility.',
        fields: [
          { name: 'legacy_version', value: '0x0303 (TLS 1.2)', hex: '03 03', note: 'Frozen for compatibility' },
          { name: 'supported_versions', value: '0x0304 (TLS 1.3)', hex: '03 04', note: 'Real version negotiation' },
          { name: 'server_name (SNI)', value: 'example.com', note: 'Sent in the clear' },
          { name: 'key_share', value: 'X25519 (32 bytes)', note: 'Ephemeral, gives forward secrecy' },
        ],
      },
      {
        from: 'server',
        to: 'client',
        title: 'ServerHello',
        caption: 'The server picks one cipher suite and its own key share. With ECDHE, both sides can derive the same shared secret.',
        fields: [
          { name: 'cipher_suite', value: 'TLS_AES_128_GCM_SHA256', hex: '13 01', note: 'AEAD and hash in one identifier' },
          { name: 'key_share', value: 'X25519 (32 bytes)', note: 'Server ephemeral key' },
          { name: 'random', value: '32 random bytes', note: 'Freshness' },
        ],
      },
      {
        from: 'server',
        to: 'client',
        title: 'Encrypted handshake',
        caption:
          'From here everything is encrypted: extensions, the certificate chain and the server Finished MAC. Passive observers only see record sizes.',
        fields: [
          { name: 'EncryptedExtensions', value: 'ALPN: h2', note: 'Negotiated application protocol' },
          { name: 'Certificate', value: 'leaf + intermediate chain', note: 'Encrypted in TLS 1.3' },
          { name: 'CertificateVerify', value: 'signature over transcript', note: 'Proves private key possession' },
          { name: 'Finished', value: 'HMAC over handshake', note: 'Detects tampering' },
        ],
      },
      {
        from: 'client',
        to: 'server',
        title: 'Client Finished',
        caption: 'The client verifies the certificate chain and the transcript, then proves it derived the same keys.',
        fields: [
          { name: 'Finished', value: 'HMAC over transcript', note: 'Handshake integrity' },
          { name: 'Record type', value: 'application_data (23)', hex: '17', note: 'Handshake is already encrypted' },
        ],
      },
      {
        from: 'client',
        to: 'server',
        title: 'Encrypted application data',
        caption:
          'The first HTTP request now travels inside AEAD records. A new TLS session key is derived from the ephemeral exchange, so a later compromise of the server key cannot decrypt this session.',
        fields: [
          { name: 'Content type', value: 'application_data', hex: '17 03 03', note: 'Outer record header' },
          { name: 'Length', value: '512', hex: '02 00', note: 'Ciphertext length' },
          { name: 'Payload', value: 'AES-128-GCM ciphertext + tag', note: 'Also carries the inner content type' },
        ],
      },
    ],
  },
  {
    id: 'arp',
    name: 'ARP',
    layer: 'Core',
    summary: 'How a host discovers the MAC address behind an IPv4 address on the same broadcast domain.',
    actors: [
      { id: 'hostA', label: 'Host A', sub: '192.168.1.10', type: 'pc' },
      { id: 'sw', label: 'Switch', sub: 'VLAN 10', type: 'switch' },
      { id: 'hostB', label: 'Host B', sub: '192.168.1.20', type: 'pc' },
    ],
    steps: [
      {
        from: 'hostA',
        to: 'sw',
        title: 'ARP request (broadcast)',
        caption: 'Host A needs a destination MAC before it can build a frame, so it broadcasts a question to the whole VLAN.',
        fields: [
          { name: 'Destination MAC', value: 'FF:FF:FF:FF:FF:FF', hex: 'FF FF FF FF FF FF', note: 'Broadcast' },
          { name: 'Opcode', value: '1 — request', hex: '00 01', note: 'ARP request' },
          { name: 'Target IP', value: '192.168.1.20', hex: 'C0 A8 01 14', note: 'Who has this address?' },
          { name: 'Target MAC', value: '00:00:00:00:00:00', hex: '00 00 00 00 00 00', note: 'Unknown, zeroed' },
        ],
      },
      {
        from: 'sw',
        to: 'hostB',
        title: 'Switch floods the broadcast',
        caption: 'Broadcasts cannot be unicast by the switch, so the frame is copied out of every other access port in the VLAN.',
        fields: [
          { name: 'VLAN tag', value: 'VLAN 10', hex: '81 00 00 0A', note: '802.1Q tag when the link is a trunk' },
          { name: 'MAC table', value: 'A: Gi0/1 → B: Gi0/2', note: 'Learned from source MACs' },
        ],
      },
      {
        from: 'hostB',
        to: 'sw',
        title: 'ARP reply (unicast)',
        caption: 'Host B answers directly to host A. It also caches host A\'s mapping, so traffic flows both ways immediately.',
        fields: [
          { name: 'Opcode', value: '2 — reply', hex: '00 02', note: 'ARP reply' },
          { name: 'Sender MAC/IP', value: '00:1A:2B:3C:4D:5E / 192.168.1.20', hex: '00 1A 2B 3C 4D 5E', note: 'The answer' },
        ],
      },
      {
        from: 'sw',
        to: 'hostA',
        title: 'Frame delivered, ARP cache filled',
        caption: 'Host A stores the mapping until it ages out, then sends the original IPv4 packet inside a unicast frame.',
        fields: [
          { name: 'Cache TTL', value: '≈ 2 minutes (OS default)', note: 'Gratuitous ARP can refresh it' },
          { name: 'Next frame', value: 'IPv4 packet → 00:1A:2B:3C:4D:5E', note: 'Now that the MAC is known' },
        ],
      },
    ],
  },
  {
    id: 'dhcp',
    name: 'DHCP',
    layer: 'Application',
    summary: 'How a laptop joins Wi-Fi: associate with the access point, prove the password, then receive an IP, mask, gateway and DNS from the router using DORA.',
    actors: [
      { id: 'client', label: 'Laptop (Wi-Fi)', sub: 'no IP yet', type: 'pc' },
      { id: 'server', label: 'Wi-Fi Router', sub: '192.168.1.1', type: 'router' },
    ],
    steps: [
      { from: 'client', to: 'server', effect: 'wifi', title: 'Wi-Fi: probe + associate', caption: 'The laptop switches its Wi-Fi radio on and broadcasts a probe/association request. Radio travels through the air, so every access point in range can hear it.', fields: [
        { name: 'SSID', value: 'HomeWiFi', note: 'Network the laptop wants to join' },
        { name: 'PHY / band', value: '802.11ax · 5 GHz', note: 'Wi-Fi 6, channel 36' },
        { name: 'Frame type', value: 'Association Request', note: 'Supported rates and capabilities' },
        { name: 'Security', value: 'WPA2-PSK (CCMP)', note: 'Announced by the router in its beacon' },
      ] },
      { from: 'server', to: 'client', effect: 'auth', badge: 'WPA2 KEY VERIFIED', title: 'WPA2: prove the password', caption: 'The router challenges the laptop to prove it knows the Wi-Fi password. The password itself never crosses the air - four messages exchange random numbers and a MIC, and both sides derive the same session keys.', fields: [
        { name: 'Message 1', value: 'ANonce from router', note: 'Router sends a random number' },
        { name: 'Message 2', value: 'SNonce + MIC from laptop', note: 'MIC proves the password without revealing it' },
        { name: 'Message 3', value: 'GTK + MIC from router', note: 'Group key for broadcast traffic' },
        { name: 'Message 4', value: 'ACK from laptop', note: 'Install keys, link is now encrypted' },
        { name: 'Result', value: 'Pairwise key installed', note: 'Wrong password fails here, before any IP is assigned' },
      ] },
      { from: 'client', to: 'server', effect: 'wifi', title: 'DISCOVER - broadcast', caption: 'Only now, with the radio link encrypted, does the laptop look for an IP. It has none, so it broadcasts from 0.0.0.0:68 to every DHCP server on the LAN.', fields: [
        { name: 'Source', value: '0.0.0.0:68', hex: '00 00 00 00 00 44', note: 'Host still has no address' },
        { name: 'Destination', value: '255.255.255.255:67', hex: 'FF FF FF FF 00 43', note: 'Broadcast on the LAN' },
        { name: 'Message type', value: '1 - DHCPDISCOVER', hex: '35 01 01', note: 'Option 53' },
        { name: 'Client identifier', value: '01 + MAC address', note: 'How the answer will be tied back to this laptop' },
      ] },
      { from: 'server', to: 'client', effect: 'offer', title: 'OFFER - an address for you', caption: 'The router picks an available address and offers it, together with the mask, itself as the gateway, and DNS servers to use.', fields: [
        { name: 'Message type', value: '2 - DHCPOFFER', hex: '35 01 02', note: 'Option 53' },
        { name: 'yiaddr (offered IP)', value: '192.168.1.57', hex: 'C0 A8 01 39', note: 'Address reserved for this laptop' },
        { name: 'Option 1 (mask)', value: '255.255.255.0', note: 'Local subnet' },
        { name: 'Option 3 (gateway)', value: '192.168.1.1', note: 'Your router - the next hop for anything off this LAN' },
        { name: 'Option 6 (DNS)', value: '1.1.1.1, 8.8.8.8', note: 'Resolvers to use' },
      ] },
      { from: 'client', to: 'server', title: 'REQUEST - I will take it', caption: 'The laptop picks one offer and formally asks for it, naming the router it selected. Any other DHCP server on the LAN backs off when it sees this.', fields: [
        { name: 'Message type', value: '3 - DHCPREQUEST', hex: '35 01 03', note: 'Option 53' },
        { name: 'Option 54', value: 'Server 192.168.1.1', note: 'Which router was chosen' },
        { name: 'Option 50', value: 'Requested 192.168.1.57', note: 'Repeated for verification' },
      ] },
      { from: 'server', to: 'client', effect: 'ack', title: 'ACK - lease bound', caption: 'The address is now truly the laptop\'s until the T1/T2 timers run. It can ARP for the gateway and start resolving names.', fields: [
        { name: 'Message type', value: '5 - DHCPACK', hex: '35 01 05', note: 'Option 53' },
        { name: 'Option 51 (lease)', value: '86400 s (24 h)', hex: '00 01 51 80', note: 'Renew before T1 = 4 hours' },
        { name: 'Option 1 (mask)', value: '255.255.255.0', note: 'Kept from the offer' },
        { name: 'Option 3 (gateway)', value: '192.168.1.1', note: 'Gateway confirmed' },
        { name: 'Option 6 (DNS)', value: '1.1.1.1, 8.8.8.8', note: 'Resolvers confirmed' },
      ] },
      { from: 'client', to: 'server', title: 'Connected', caption: 'Encrypted radio link, an address, a mask, a gateway and DNS. The laptop can now ping the router and start the DNS -> TCP -> HTTPS flow from the other lessons.', fields: [
        { name: 'Now has', value: 'Wi-Fi key + IP + mask + gateway + DNS', note: 'Everything a host needs to join a network' },
        { name: 'Next step', value: 'ping 192.168.1.1, then open a web page', note: 'The lessons you watched earlier now apply' },
      ] },
    ],
  },
  {
    id: 'icmp',
    name: 'ICMP',
    layer: 'Core',
    summary: 'What actually happens on the wire when you ping a host that is one router away.',
    actors: [
      { id: 'pc', label: 'PC', sub: '192.168.1.20', type: 'pc' },
      { id: 'gw', label: 'Gateway', sub: '192.168.1.1', type: 'router' },
      { id: 'srv', label: 'Remote Host', sub: '8.8.8.8', type: 'server' },
    ],
    steps: [
      {
        from: 'pc',
        to: 'gw',
        title: 'Echo Request (hop 1)',
        caption:
          'The PC must first ARP for the gateway, then sends the echo request to the gateway MAC while keeping the destination IP unchanged.',
        fields: [
          { name: 'Type / Code', value: '8 / 0 — Echo Request', hex: '08 00', note: 'ICMP type 8' },
          { name: 'Identifier', value: '0x2A21', hex: '2A 21', note: 'Matches replies to this ping process' },
          { name: 'Sequence', value: '1', hex: '00 01', note: 'Increments per packet' },
          { name: 'Checksum', value: '0x9F3C', hex: '9F 3C', note: 'Header integrity only' },
        ],
      },
      {
        from: 'gw',
        to: 'srv',
        title: 'Routed onward, TTL decremented',
        caption: 'Every router decrements the TTL. If it reaches zero the packet is dropped and an ICMP Time Exceeded is returned — the basis of traceroute.',
        fields: [
          { name: 'TTL', value: '63 (was 64)', hex: '3F', note: 'Decremented by the gateway' },
          { name: 'Source IP', value: '192.168.1.20', note: 'Unchanged in transit (no NAT here)' },
          { name: 'Destination MAC', value: 'Next-hop MAC', hex: '', note: 'Rewritten at every hop' },
        ],
      },
      {
        from: 'srv',
        to: 'gw',
        title: 'Echo Reply',
        caption: 'The remote host swaps type 8 for type 0 and sends the payload back untouched. RTT is measured by the client.',
        fields: [
          { name: 'Type / Code', value: '0 / 0 — Echo Reply', hex: '00 00', note: 'ICMP type 0' },
          { name: 'Identifier', value: '0x2A21', hex: '2A 21', note: 'Echoed back' },
          { name: 'Sequence', value: '1', hex: '00 01', note: 'Same sequence' },
        ],
      },
      {
        from: 'gw',
        to: 'pc',
        title: 'Reply delivered',
        caption: 'The gateway forwards the reply to the PC. Output shows round-trip min/avg/max and any loss.',
        fields: [
          { name: 'Reported RTT', value: '≈ 12–17 ms', note: 'Measured by the sender, not carried in the packet' },
          { name: 'Loss', value: '0 %', note: 'Reply received within the timeout' },
        ],
      },
    ],
  },
  {
    id: 'rdp',
    name: 'RDP',
    layer: 'Application',
    summary: 'Remote Desktop: how a workstation takes over a Windows desktop on port 3389, and why the credentials are checked before any pixels are sent.',
    actors: [
      { id: 'client', label: 'Workstation', sub: '192.168.1.20', type: 'pc' },
      { id: 'host', label: 'RDP Host (Windows)', sub: '10.0.5.12:3389', type: 'server' },
    ],
    steps: [
      { from: 'client', to: 'host', title: 'TCP connect to :3389', caption: 'Remote Desktop starts like any TCP service: the workstation opens a connection to port 3389. If the firewall filters that port, nothing below this line ever happens.', fields: [
        { name: 'Source port', value: '51324', hex: 'C8 3C', note: 'Ephemeral client port' },
        { name: 'Destination port', value: '3389', hex: '0D 3D', note: 'IANA: ms-wbt-server' },
        { name: 'Flags', value: 'SYN', hex: '00 02', note: 'Handshake begins' },
        { name: 'Window', value: '64240', hex: 'FA F0', note: 'Receive window' },
      ] },
      { from: 'client', to: 'host', title: 'X.224: negotiate security', caption: 'An RDP-specific X.224 request lists the security protocols the client supports. The server confirms one in its reply, normally CredSSP (NLA) carried inside TLS.', fields: [
        { name: 'TPKT header', value: '03 00 00 13', hex: '03 00 00 13', note: 'Length of the RDP packet' },
        { name: 'X.224 type', value: '0xE0 - Connection Request', hex: 'E0', note: 'One byte distinguishes it from X.224 data' },
        { name: 'Requested protocols', value: 'TLS | CredSSP', hex: '0B 00 00 00', note: 'Negotiation bitmask' },
        { name: 'Server confirm', value: 'CredSSP selected', note: 'NLA will be used' },
      ] },
      { from: 'client', to: 'host', effect: 'auth', badge: 'CREDSSP VERIFIED', title: 'TLS + CredSSP (NLA)', caption: 'TLS encrypts the channel, then CredSSP authenticates the user before a desktop exists. Wrong, expired or locked-out credentials are rejected here, which is why NLA stops bad logins early.', fields: [
        { name: 'TLS', value: '1.2 / 1.3', note: 'Protects the RDP channel' },
        { name: 'Host certificate', value: 'machine cert', note: 'Self-signed or from a CA' },
        { name: 'CredSSP', value: 'NTLM or Kerberos', note: 'User credentials, not the machine cert' },
        { name: 'Result', value: 'user authenticated', note: 'No session created yet' },
      ] },
      { from: 'host', to: 'client', title: 'MCS + capability exchange', caption: 'The session is built: MCS joins the channels, then both sides swap capabilities. Virtual channels are what make clipboard, drive redirection and audio work inside the remote desktop.', fields: [
        { name: 'Virtual channels', value: 'cliprdr, rdpdr, rdpsnd', note: 'Clipboard, drives, sound' },
        { name: 'Desktop', value: '1920 x 1080, 32 bpp', note: 'Negotiated size and colour depth' },
        { name: 'Codec', value: 'RemoteFX / H.264', note: 'Depends on host and client' },
        { name: 'Session security', value: 'AES (or FIPS)', note: 'Applied after the handshake' },
      ] },
      { from: 'host', to: 'client', title: 'Desktop frames + input', caption: 'Now the pixels move. The host streams drawing orders and bitmap updates, while the client sends keyboard and mouse events back over the same encrypted connection.', fields: [
        { name: 'Updates', value: 'bitmap + orders', note: 'Only changed regions are sent' },
        { name: 'Input', value: 'keyboard + mouse (reverse)', note: 'Client to host on the same channel' },
        { name: 'Bandwidth', value: 'adaptive', note: 'Throttled by measured RTT' },
      ] },
      { from: 'host', to: 'client', title: 'Session end / lock', caption: 'Locking the workstation or closing the RDP window disconnects the session but leaves it alive on the host. The user is only logged out when they explicitly sign out.', fields: [
        { name: 'Reason', value: 'user disconnect / idle timeout', note: 'TCP 3389 closed for this client' },
        { name: 'Session state', value: 'disconnected, kept alive', note: 'Reconnect resumes the same desktop' },
        { name: 'Data left', value: 'none in transit', note: 'Everything was TLS-protected' },
      ] },
    ],
  },
];

export const lessonLayers = ['Core', 'Application', 'Security'];
