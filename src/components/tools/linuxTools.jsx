import React, { useMemo, useState } from 'react';
import { FormTool, InfoList } from './kit';
import { Callout, Panel } from './toolUi';

const ROLES = ['owner', 'group', 'others'];
const PERMS = [
  { key: 'read', label: 'Read', bit: 4, symbol: 'r' },
  { key: 'write', label: 'Write', bit: 2, symbol: 'w' },
  { key: 'exec', label: 'Execute', bit: 1, symbol: 'x' },
];

export const ChmodCalculator = () => (
  <FormTool
    fields={[
      ...ROLES.flatMap((role) =>
        PERMS.map((perm) => ({
          key: `${role}-${perm.key}`,
          label: `${role} ${perm.label}`,
          type: 'checkbox',
          checkboxLabel: `${role}: ${perm.label} (${perm.symbol})`,
          default: role === 'owner',
        })),
      ),
      { key: 'special', label: 'Special bits', type: 'select', default: 'none', options: [
        { value: 'none', label: 'None' },
        { value: 'suid', label: 'SUID (4) — run as file owner' },
        { value: 'sgid', label: 'SGID (2) — inherit group' },
        { value: 'sticky', label: 'Sticky (1) — only owner deletes' },
      ] },
      { key: 'target', label: 'File or directory', type: 'text', default: 'script.sh' },
    ]}
    compute={(values) => {
      const roleValue = (role) =>
        PERMS.reduce((sum, perm) => sum + (values[`${role}-${perm.key}`] ? perm.bit : 0), 0);
      const owner = roleValue('owner');
      const group = roleValue('group');
      const others = roleValue('others');
      const specialDigit = { none: 0, suid: 4, sgid: 2, sticky: 1 }[values.special] || 0;
      const octal = `${specialDigit}${owner}${group}${others}`;
      const symbolic = ROLES.map((role) => {
        const value = roleValue(role);
        return PERMS.map((perm) => (value & perm.bit ? perm.symbol : '-')).join('');
      }).join('');
      return {
        stats: [
          { label: 'Octal mode', value: octal, tone: 'text-cyan-300' },
          { label: 'Symbolic', value: symbolic, tone: 'text-white' },
          { label: 'Owner', value: owner },
          { label: 'Group / Others', value: `${group} / ${others}` },
        ],
        lines: [
          { label: 'Command', value: `chmod ${octal} ${values.target || 'file'}` },
          { label: 'Recursive (directories)', value: `chmod -R ${octal} ${values.target || 'dir'}` },
          { label: 'Check result', value: `ls -l ${values.target || 'file'}` },
        ],
        note: octal === '777'
          ? '777 is almost never the right answer: every user can rewrite the file. Use 644 for files and 755 for directories and scripts.'
          : 'Common safe modes: 644 files, 755 directories and scripts, 600 private keys, 640 shared config with the group.',
        noteTone: octal === '777' ? 'warn' : 'info',
      };
    }}
  >
    <InfoList
      title="Permission rules worth memorising"
      items={[
        'Read = 4, write = 2, execute = 1. Add them per role: 7 = rwx, 6 = rw-, 5 = r-x, 4 = r--.',
        'A directory needs execute (x) to enter it, read (r) to list it, write (w) to create files inside.',
        'chown changes the owner; chmod never changes ownership.',
        'SUID on a binary makes it run with the owner’s rights — that is why ping works for normal users.',
      ]}
    />
  </FormTool>
);

const toCron = ({ preset, minute, hour, weekday }) => {
  if (preset === 'every-minute') return '* * * * *';
  if (preset === 'every-5') return '*/5 * * * *';
  if (preset === 'every-15') return '*/15 * * * *';
  if (preset === 'hourly') return `${minute} * * * *`;
  if (preset === 'daily') return `${minute} ${hour} * * *`;
  if (preset === 'weekly') return `${minute} ${hour} * * ${weekday}`;
  if (preset === 'monthly') return `${minute} ${hour} 1 * *`;
  if (preset === 'reboot') return '@reboot';
  return `${minute} ${hour} * * *`;
};

const describe = ({ preset, minute, hour, weekday }) => {
  const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  if (preset === 'every-minute') return 'Runs every single minute.';
  if (preset === 'every-5') return 'Runs every 5 minutes, all day.';
  if (preset === 'every-15') return 'Runs every 15 minutes, all day.';
  if (preset === 'hourly') return `Runs once an hour at minute ${minute}.`;
  if (preset === 'daily') return `Runs every day at ${String(hour).padStart(2, '0')}:${String(minute).padStart(2, '0')}.`;
  if (preset === 'weekly') return `Runs every ${days[weekday]} at ${String(hour).padStart(2, '0')}:${String(minute).padStart(2, '0')}.`;
  if (preset === 'monthly') return `Runs on the 1st of every month at ${String(hour).padStart(2, '0')}:${String(minute).padStart(2, '0')}.`;
  if (preset === 'reboot') return 'Runs once at system boot.';
  return 'Custom schedule.';
};

export const CronBuilder = () => (
  <FormTool
    fields={[
      { key: 'preset', label: 'Schedule', type: 'select', default: 'daily', options: [
        { value: 'every-minute', label: 'Every minute' },
        { value: 'every-5', label: 'Every 5 minutes' },
        { value: 'every-15', label: 'Every 15 minutes' },
        { value: 'hourly', label: 'Every hour' },
        { value: 'daily', label: 'Every day at a fixed time' },
        { value: 'weekly', label: 'Every week' },
        { value: 'monthly', label: 'Every month (1st)' },
        { value: 'reboot', label: 'On reboot' },
      ] },
      { key: 'minute', label: 'Minute (0–59)', type: 'number', default: 30, min: 0, max: 59 },
      { key: 'hour', label: 'Hour (0–23)', type: 'number', default: 2, min: 0, max: 23 },
      { key: 'weekday', label: 'Day of week', type: 'select', numeric: true, default: 1, options: [
        { value: 0, label: 'Sunday' }, { value: 1, label: 'Monday' }, { value: 2, label: 'Tuesday' },
        { value: 3, label: 'Wednesday' }, { value: 4, label: 'Thursday' }, { value: 5, label: 'Friday' },
        { value: 6, label: 'Saturday' },
      ] },
      { key: 'command', label: 'Command to run', type: 'text', default: '/usr/local/bin/backup.sh' },
    ]}
    compute={(values) => {
      const expression = toCron(values);
      return {
        stats: [
          { label: 'Cron expression', value: expression, tone: 'text-cyan-300' },
          { label: 'Meaning', value: describe(values) },
        ],
        lines: [
          { label: 'Crontab line', value: `${expression} ${values.command || '/path/to/script.sh'}` },
          { label: 'Edit crontab', value: 'crontab -e' },
          { label: 'List jobs', value: 'crontab -l' },
          { label: 'Log output', value: `${expression} ${values.command || '/path/to/script.sh'} >> /var/log/cronjob.log 2>&1` },
        ],
        note: 'Cron does not know your PATH or environment variables. Use absolute paths and redirect output to a log file, otherwise a failing job stays invisible.',
      };
    }}
  />
);

const COMMANDS = [
  { cmd: 'ls -la', what: 'List every file including hidden ones, with permissions, owner and size.' },
  { cmd: 'cd /var/log', what: 'Change into the log directory.' },
  { cmd: 'pwd', what: 'Print the directory you are currently in.' },
  { cmd: 'cat file.txt', what: 'Print a whole file to the terminal.' },
  { cmd: 'less file.txt', what: 'Scroll through a large file, / to search, q to quit.' },
  { cmd: 'grep -i error /var/log/syslog', what: 'Find lines containing "error" (case-insensitive) — the fastest log triage.' },
  { cmd: 'tail -f /var/log/nginx/access.log', what: 'Follow a log live as new lines arrive.' },
  { cmd: 'chmod 755 script.sh', what: 'Owner rwx, group and others r-x.' },
  { cmd: 'chown user:group file', what: 'Change owner and group of a file.' },
  { cmd: 'ps aux', what: 'List every running process with CPU and memory usage.' },
  { cmd: 'top', what: 'Live process and resource monitor; press q to quit.' },
  { cmd: 'kill -9 1234', what: 'Force-kill process 1234 (SIGKILL).' },
  { cmd: 'systemctl status ssh', what: 'Check whether a service is running, and its recent log lines.' },
  { cmd: 'systemctl restart ssh', what: 'Restart a service after changing its config.' },
  { cmd: 'journalctl -u ssh -n 50', what: 'Last 50 log lines for one systemd service.' },
  { cmd: 'ip a', what: 'Show every network interface with its IP addresses.' },
  { cmd: 'ip route', what: 'Show the routing table and default gateway.' },
  { cmd: 'ss -tuln', what: 'List listening TCP/UDP ports — replaces netstat.' },
  { cmd: 'ping -c 4 8.8.8.8', what: 'Send four ICMP echoes to test Layer 3 reachability.' },
  { cmd: 'traceroute google.com', what: 'Show every router hop on the path.' },
  { cmd: 'dig example.com +short', what: 'Resolve a domain and print only the answer.' },
  { cmd: 'curl -I https://example.com', what: 'Fetch only the HTTP response headers.' },
  { cmd: 'df -h', what: 'Disk usage per filesystem in human units.' },
  { cmd: 'du -sh /var/log', what: 'Total size of one directory.' },
  { cmd: 'free -h', what: 'RAM and swap usage.' },
  { cmd: 'find / -name "*.conf" 2>/dev/null', what: 'Search for files by name, hiding permission errors.' },
  { cmd: 'tar -czvf backup.tar.gz /etc', what: 'Create a compressed archive of /etc.' },
  { cmd: 'useradd -m student', what: 'Create a user with a home directory.' },
  { cmd: 'passwd student', what: 'Set or change a user password.' },
  { cmd: 'sudo -l', what: 'Show what the current user may run with sudo.' },
];

export const LinuxCheatsheet = () => {
  const [query, setQuery] = useState('');
  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return COMMANDS;
    return COMMANDS.filter((item) => `${item.cmd} ${item.what}`.toLowerCase().includes(q));
  }, [query]);

  return (
    <div className="space-y-4">
      <Panel>
        <input
          value={query}
          onChange={(event) => setQuery(event.target.value)}
          placeholder="What do you want to do? Try “port”, “space”, “restart”, “permission”…"
          className="w-full rounded-xl border border-slate-700 bg-navy-950 px-4 py-2.5 text-sm text-white outline-none focus:border-electric-400"
        />
        <p className="mt-2 text-[11px] text-slate-500">{filtered.length} commands</p>
      </Panel>
      <div className="space-y-2">
        {filtered.map((item) => (
          <div key={item.cmd} className="rounded-xl border border-slate-800 bg-navy-900 p-3.5">
            <code className="font-mono text-xs text-cyan-300">{item.cmd}</code>
            <p className="mt-1 text-[11px] leading-relaxed text-slate-400">{item.what}</p>
          </div>
        ))}
        {filtered.length === 0 && (
          <Callout tone="warn">No command matches that search. Try a plainer word like “file”, “network” or “service”.</Callout>
        )}
      </div>
    </div>
  );
};

export const SystemdUnit = () => (
  <FormTool
    fields={[
      { key: 'name', label: 'Service name', type: 'text', default: 'rtechlab-app' },
      { key: 'description', label: 'Description', type: 'text', default: 'RTechLab application service' },
      { key: 'exec', label: 'Command to run', type: 'text', default: '/usr/bin/node /opt/app/server.js' },
      { key: 'user', label: 'Run as user', type: 'text', default: 'www-data' },
      { key: 'restart', label: 'Restart policy', type: 'select', default: 'always', options: [
        { value: 'always', label: 'always — restart on any exit' },
        { value: 'on-failure', label: 'on-failure — only non-zero exits' },
        { value: 'no', label: 'no — never restart' },
      ] },
    ]}
    compute={({ name, description, exec, user, restart }) => {
      const unit = [
        '[Unit]',
        `Description=${description}`,
        'After=network.target',
        '',
        '[Service]',
        'Type=simple',
        `User=${user}`,
        `ExecStart=${exec}`,
        `Restart=${restart}`,
        'RestartSec=5',
        'WorkingDirectory=/opt/app',
        '',
        '[Install]',
        'WantedBy=multi-user.target',
      ].join('\n');
      return {
        stats: [
          { label: 'Unit file', value: `/etc/systemd/system/${name}.service` },
          { label: 'Restart policy', value: restart },
          { label: 'Runs as', value: user },
        ],
        lines: [
          { label: 'Save the file', value: `sudo nano /etc/systemd/system/${name}.service` },
          { label: 'Reload systemd', value: 'sudo systemctl daemon-reload' },
          { label: 'Enable at boot', value: `sudo systemctl enable ${name}` },
          { label: 'Start now', value: `sudo systemctl start ${name}` },
          { label: 'Check status', value: `systemctl status ${name}` },
          { label: 'Follow logs', value: `journalctl -u ${name} -f` },
        ],
        note: unit,
        noteTone: 'info',
      };
    }}
  />
);

export const DiskPlanner = () => (
  <FormTool
    fields={[
      { key: 'disk', label: 'Disk size (GB)', type: 'number', default: 100, min: 8 },
      { key: 'ram', label: 'RAM (GB)', type: 'number', default: 8, min: 1 },
      { key: 'layout', label: 'Layout', type: 'select', default: 'server', options: [
        { value: 'server', label: 'Server (separate /var and /home)' },
        { value: 'desktop', label: 'Desktop / laptop (simpler)' },
      ] },
      { key: 'home', label: 'User data expected (GB)', type: 'number', default: 20, min: 0 },
    ]}
    compute={({ disk, ram, layout, home }) => {
      const total = Number(disk) || 0;
      const memory = Number(ram) || 0;
      const data = Number(home) || 0;
      const swap = memory <= 8 ? memory * 2 : memory <= 32 ? memory : Math.round(memory / 2);
      const boot = 1;
      const root = layout === 'server' ? Math.max(15, Math.round(total * 0.2)) : Math.max(25, Math.round(total * 0.5));
      const varSize = layout === 'server' ? Math.max(10, Math.round(total * 0.15)) : 0;
      const homeSize = layout === 'server' ? Math.max(data, Math.round(total * 0.4)) : Math.max(data, Math.round(total * 0.45));
      const used = boot + swap + root + varSize + homeSize;
      const free = total - used;
      const rows = [
        { label: `/boot`, value: `${boot} GB` },
        { label: 'swap', value: `${swap} GB` },
        { label: `/`, value: `${root} GB` },
        ...(varSize ? [{ label: '/var', value: `${varSize} GB` }] : []),
        { label: '/home', value: `${homeSize} GB` },
        { label: 'Unallocated', value: `${free} GB` },
      ];
      return {
        stats: [
          { label: 'Allocated', value: `${used} GB`, tone: 'text-cyan-300' },
          { label: 'Free space', value: `${free} GB`, tone: free < 0 ? 'text-red-400' : 'text-emerald-400' },
          { label: 'Swap rule', value: `${swap} GB`, hint: '≈ 2× RAM up to 8 GB, then RAM size' },
          { label: 'Filesystem', value: 'ext4 or xfs' },
        ],
        lines: rows,
        note: free < 0
          ? 'The plan is larger than the disk. Reduce /home or use LVM so you can grow volumes later.'
          : 'On servers keep a separate /var: logs and databases grow there, and a full /var should never take the whole system down. LVM lets you resize later.',
        noteTone: free < 0 ? 'error' : 'info',
      };
    }}
  />
);
