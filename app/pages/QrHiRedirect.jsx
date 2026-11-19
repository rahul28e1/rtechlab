import React from 'react';
import { Navigate, useParams } from 'react-router-dom';

const QUIZ_CODES = {
  'ccna-m1': '/hi/quiz/ccna-m1',
  'ccna-m2': '/hi/quiz/ccna-m2',
  'ccna-m3': '/hi/quiz/ccna-m3',
};

export function QrHiRedirect() {
  const { code } = useParams();
  const to = QUIZ_CODES[code] || '/hi/notes';
  return <Navigate to={to} replace />;
}

export default QrHiRedirect;
