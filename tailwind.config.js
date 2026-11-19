/** @type {import('tailwindcss').Config} */

// Palette is remapped to an Apple-like neutral system: true black canvas,
// graphite surfaces, one blue accent, and neutral grays for type.
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
    "./app/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        accent: '#0071E3',
        navy: {
          950: '#000000',
          900: '#1D1D1F',
          850: '#242426',
          800: '#2C2C2E',
          700: '#3A3A3C',
          600: '#48484A',
        },
        electric: {
          DEFAULT: '#0071E3',
          50: '#EAF4FF',
          100: '#D6E9FF',
          200: '#B3D6FF',
          300: '#2997FF',
          400: '#2997FF',
          500: '#0071E3',
          600: '#0071E3',
          700: '#0062C4',
        },
        cyber: {
          DEFAULT: '#2997FF',
          400: '#6CB0F5',
          500: '#0071E3',
          600: '#0062C4',
        },
        slate: {
          50: '#FAFAFC',
          100: '#F5F5F7',
          200: '#E8E8ED',
          300: '#D2D2D7',
          400: '#A1A1A6',
          500: '#86868B',
          600: '#6E6E73',
          700: '#424245',
          800: '#2C2C2E',
          900: '#1D1D1F',
          950: '#000000',
        },
      },
      fontFamily: {
        sans: [
          '"Plus Jakarta Sans"',
          '"Inter"',
          '-apple-system',
          'BlinkMacSystemFont',
          '"SF Pro Display"',
          '"SF Pro Text"',
          '"Segoe UI"',
          'Roboto',
          '"Helvetica Neue"',
          'Arial',
          'sans-serif',
        ],
        mono: ['"JetBrains Mono"', '"SF Mono"', 'ui-monospace', 'Menlo', 'monospace'],
      },
      borderRadius: {
        xl: '14px',
        '2xl': '22px',
        '3xl': '28px',
      },
      boxShadow: {
        'glow-electric': '0 0 0 0 rgba(0, 0, 0, 0)',
        'glow-cyan': '0 0 0 0 rgba(0, 0, 0, 0)',
        card: '0 2px 12px rgba(0, 0, 0, 0.4)',
      },
      transitionTimingFunction: {
        apple: 'cubic-bezier(0.16, 1, 0.3, 1)',
      },
      animation: {
        'pulse-subtle': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'float': 'float 6s ease-in-out infinite',
      },
      keyframes: {
        float: {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-6px)' },
        }
      }
    },
  },
  plugins: [],
}
