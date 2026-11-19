import { Link } from 'react-router-dom';

export function Footer() {
  return (
    <footer className="footer">
      <p>RTechLab — Free Networking, Security &amp; Cloud Education</p>
      <p>
        <Link to="/privacy">Privacy</Link> · <Link to="/terms">Terms</Link> · <Link to="/contact">Contact</Link>
      </p>
    </footer>
  );
}
