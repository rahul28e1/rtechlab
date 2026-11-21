import React from 'react';
import { NavLink, useLocation } from 'react-router';

export function MobileBottomNav() {
  const location = useLocation();
  const isHindi = location.pathname.startsWith('/hi');

  const navItems = [
    {
      to: isHindi ? '/hi/notes' : '/notes',
      label: 'Notes',
      icon: (
        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
        </svg>
      ),
      badge: '₹49',
    },
    {
      to: '/tools',
      label: 'Tools',
      icon: (
        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
        </svg>
      ),
      badge: 'Free',
    },
    {
      to: isHindi ? '/hi/tutorials' : '/tutorials',
      label: 'Videos',
      icon: (
        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z" />
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
      ),
    },
    {
      to: 'https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i',
      label: 'WhatsApp',
      isExternal: true,
      icon: (
        <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
          <path d="M12.031 6.172c-3.181 0-5.767 2.586-5.768 5.766-.001 1.298.38 2.27 1.019 3.287l-.582 2.128 2.182-.573c.978.58 1.911.928 3.145.929 3.178 0 5.767-2.587 5.768-5.766.001-3.187-2.575-5.77-5.764-5.771zm3.392 8.244c-.144.405-.837.774-1.17.824-.312.045-.698.082-2.115-.508-1.574-.658-2.583-2.257-2.662-2.361-.078-.105-.639-.851-.639-1.624 0-.773.405-1.154.55-1.309.144-.156.315-.195.42-.195.105 0 .21.001.301.006.096.005.226-.036.353.271.132.318.452 1.102.492 1.182.04.079.066.173.013.278-.053.106-.079.172-.158.264-.079.092-.167.206-.238.277-.079.079-.162.164-.07.322.092.158.409.676.879 1.094.605.539 1.116.707 1.273.786.158.079.25.066.342-.04.092-.105.395-.461.5-.619.105-.158.21-.132.355-.079.145.053.92.434 1.078.513.158.079.263.118.303.184.04.066.04.382-.104.787z" />
          <path d="M12 2C6.477 2 2 6.477 2 12c0 1.89.525 3.66 1.438 5.168L2.05 22l4.98-1.307C8.454 21.536 10.17 22 12 22c5.523 0 10-4.477 10-10S17.523 2 12 2zm0 18.167c-1.63 0-3.14-.492-4.404-1.334l-.316-.21-2.964.777.791-2.89-.23-.367C3.96 14.82 3.458 13.45 3.458 12c0-4.71 3.832-8.542 8.542-8.542 4.71 0 8.542 3.832 8.542 8.542 0 4.71-3.832 8.542-8.542 8.542z" />
        </svg>
      ),
      isHighlight: true,
    },
  ];

  return (
    <nav
      aria-label="Mobile Navigation"
      className="md:hidden fixed bottom-0 left-0 right-0 z-40 bg-[#090a0f]/90 backdrop-blur-2xl border-t border-white/[0.08] px-2 py-1.5 transition-all print:hidden"
      style={{ paddingBottom: 'max(0.5rem, env(safe-area-inset-bottom))' }}
    >
      <div className="grid grid-cols-4 gap-1 items-center max-w-md mx-auto">
        {navItems.map((item) => {
          if (item.isExternal) {
            return (
              <a
                key={item.label}
                href={item.to}
                target="_blank"
                rel="noopener noreferrer"
                className="flex flex-col items-center justify-center py-1 px-1 rounded-xl text-emerald-400 hover:text-emerald-300 transition-all active:scale-95"
              >
                <div className="relative">
                  {item.icon}
                  <span className="absolute -top-1 -right-1 w-2 h-2 rounded-full bg-emerald-400 animate-ping" />
                </div>
                <span className="text-[10px] font-medium tracking-tight mt-0.5">{item.label}</span>
              </a>
            );
          }

          return (
            <NavLink
              key={item.to}
              to={item.to}
              className={({ isActive }) =>
                `flex flex-col items-center justify-center py-1 px-1 rounded-xl transition-all active:scale-95 relative ${
                  isActive
                    ? 'text-white font-bold'
                    : 'text-[#8E8E93] hover:text-[#D1D1D6]'
                }`
              }
            >
              {({ isActive }) => (
                <>
                  <div className="relative">
                    {item.icon}
                    {item.badge && (
                      <span
                        className={`absolute -top-1.5 -right-2.5 text-[8px] font-mono font-bold px-1 py-0.2 rounded-full leading-tight ${
                          item.badge === 'Free'
                            ? 'bg-cyan-500/20 text-cyan-300 border border-cyan-500/30'
                            : 'bg-emerald-500/20 text-emerald-300 border border-emerald-500/30'
                        }`}
                      >
                        {item.badge}
                      </span>
                    )}
                  </div>
                  <span className={`text-[10px] tracking-tight mt-0.5 ${isActive ? 'text-white font-bold' : ''}`}>
                    {item.label}
                  </span>
                  {isActive && (
                    <span className="w-1 h-1 rounded-full bg-emerald-400 mt-0.5" />
                  )}
                </>
              )}
            </NavLink>
          );
        })}
      </div>
    </nav>
  );
}
