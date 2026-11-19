import { Navbar } from './Navbar';
import { Footer } from './Footer';

export function RootLayout({ children }) {
  return (
    <div className="min-h-screen flex flex-col bg-navy-950 text-slate-100 font-sans">
      <Navbar />
      <main className="flex-1">{children}</main>
      <Footer />
    </div>
  );
}
