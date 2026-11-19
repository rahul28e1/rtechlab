import React from 'react';
import { ProtocolScene } from './scenes/protocolScenes';

// One clean, protocol-specific diagram per lesson. Every scene is driven by the
// lesson's own actors and steps, so sender and receiver are always the real pair.
export const NetworkScene = ({ lesson, stepIndex, speed = 1 }) => (
  <ProtocolScene lesson={lesson} stepIndex={stepIndex} speed={speed} />
);
