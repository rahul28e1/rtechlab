import React from 'react';
import { Navigate, useParams } from 'react-router-dom';

const QUIZ_CODES = {
  'ccna-m1': '/quiz/ccna-m1',
  'ccna-m2': '/quiz/ccna-m2',
  'ccna-m3': '/quiz/ccna-m3',
};

export function QrRedirect() {
  const { code } = useParams();
  const to = QUIZ_CODES[code] || '/notes';
  return <Navigate to={to} replace />;
}
