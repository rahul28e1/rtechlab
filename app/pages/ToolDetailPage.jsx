import React, { useEffect } from 'react';
import { useParams } from 'react-router';
import { getTool } from '../../src/data/toolCatalog';
import { renderTool } from '../../src/components/tools/registry';
import { ToolShell } from '../../src/components/tools/ToolShell';
import { markToolTried } from '../../src/utils/toolProgress';
import NotFoundPage from './NotFoundPage';

export function ToolDetailPage() {
  const { slug } = useParams();
  const tool = getTool(slug);
  const rendered = renderTool(slug);

  // Opening a tool counts as trying it; the hub reads this back as progress.
  useEffect(() => {
    if (tool) markToolTried(tool.slug);
  }, [tool]);

  if (!tool || !rendered) return <NotFoundPage />;

  // Keyed by slug so moving between simulators replays the setup animation.
  return <ToolShell key={tool.slug} tool={tool}>{rendered}</ToolShell>;
}

export default ToolDetailPage;
