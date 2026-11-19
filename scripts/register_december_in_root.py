# -*- coding: utf-8 -*-
ROOT_PATH = r"c:\Users\Rahul\Videos\My projects\RtechLab\video-engine\src\Root.jsx"

with open(ROOT_PATH, "r", encoding="utf-8") as f:
    content = f.read()

import_statement = """import {
  DecemberEpisode03HIBright, DecemberEpisode03ENBright,
  DecemberEpisode04HIBright, DecemberEpisode04ENBright,
  DecemberEpisode05HIBright, DecemberEpisode05ENBright,
  DecemberEpisode06HIBright, DecemberEpisode06ENBright,
  DecemberEpisode07HIBright, DecemberEpisode07ENBright,
  DecemberEpisode08HIBright, DecemberEpisode08ENBright,
  DecemberEpisode09HIBright, DecemberEpisode09ENBright,
  DecemberEpisode10HIBright, DecemberEpisode10ENBright,
  DecemberEpisode11HIBright, DecemberEpisode11ENBright,
  DecemberEpisode12HIBright, DecemberEpisode12ENBright,
  DecemberEpisode13HIBright, DecemberEpisode13ENBright,
  DecemberEpisode14HIBright, DecemberEpisode14ENBright,
  DecemberEpisode15HIBright, DecemberEpisode15ENBright,
  DecemberEpisode16HIBright, DecemberEpisode16ENBright,
} from './compositions/december/DecemberEpisodesRegistry.jsx';

import { EP03_CONFIG } from './compositions/december/configs/ep03_config';
import { EP04_CONFIG } from './compositions/december/configs/ep04_config';
import { EP05_CONFIG } from './compositions/december/configs/ep05_config';
import { EP06_CONFIG } from './compositions/december/configs/ep06_config';
import { EP07_CONFIG } from './compositions/december/configs/ep07_config';
import { EP08_CONFIG } from './compositions/december/configs/ep08_config';
import { EP09_CONFIG } from './compositions/december/configs/ep09_config';
import { EP10_CONFIG } from './compositions/december/configs/ep10_config';
import { EP11_CONFIG } from './compositions/december/configs/ep11_config';
import { EP12_CONFIG } from './compositions/december/configs/ep12_config';
import { EP13_CONFIG } from './compositions/december/configs/ep13_config';
import { EP14_CONFIG } from './compositions/december/configs/ep14_config';
import { EP15_CONFIG } from './compositions/december/configs/ep15_config';
import { EP16_CONFIG } from './compositions/december/configs/ep16_config';
"""

compositions_block = """
      {/* DECEMBER EPISODES 03 - 16 (100% Bright Motion Graphics • Connected Season 1) */}
      <Composition id="DecemberEpisode03HIBright" component={DecemberEpisode03HIBright} durationInFrames={EP03_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode03ENBright" component={DecemberEpisode03ENBright} durationInFrames={EP03_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode04HIBright" component={DecemberEpisode04HIBright} durationInFrames={EP04_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode04ENBright" component={DecemberEpisode04ENBright} durationInFrames={EP04_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode05HIBright" component={DecemberEpisode05HIBright} durationInFrames={EP05_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode05ENBright" component={DecemberEpisode05ENBright} durationInFrames={EP05_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode06HIBright" component={DecemberEpisode06HIBright} durationInFrames={EP06_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode06ENBright" component={DecemberEpisode06ENBright} durationInFrames={EP06_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode07HIBright" component={DecemberEpisode07HIBright} durationInFrames={EP07_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode07ENBright" component={DecemberEpisode07ENBright} durationInFrames={EP07_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode08HIBright" component={DecemberEpisode08HIBright} durationInFrames={EP08_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode08ENBright" component={DecemberEpisode08ENBright} durationInFrames={EP08_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode09HIBright" component={DecemberEpisode09HIBright} durationInFrames={EP09_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode09ENBright" component={DecemberEpisode09ENBright} durationInFrames={EP09_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode10HIBright" component={DecemberEpisode10HIBright} durationInFrames={EP10_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode10ENBright" component={DecemberEpisode10ENBright} durationInFrames={EP10_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode11HIBright" component={DecemberEpisode11HIBright} durationInFrames={EP11_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode11ENBright" component={DecemberEpisode11ENBright} durationInFrames={EP11_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode12HIBright" component={DecemberEpisode12HIBright} durationInFrames={EP12_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode12ENBright" component={DecemberEpisode12ENBright} durationInFrames={EP12_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode13HIBright" component={DecemberEpisode13HIBright} durationInFrames={EP13_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode13ENBright" component={DecemberEpisode13ENBright} durationInFrames={EP13_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode14HIBright" component={DecemberEpisode14HIBright} durationInFrames={EP14_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode14ENBright" component={DecemberEpisode14ENBright} durationInFrames={EP14_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode15HIBright" component={DecemberEpisode15HIBright} durationInFrames={EP15_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode15ENBright" component={DecemberEpisode15ENBright} durationInFrames={EP15_CONFIG.totalFrames} fps={30} width={1080} height={1920} />

      <Composition id="DecemberEpisode16HIBright" component={DecemberEpisode16HIBright} durationInFrames={EP16_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
      <Composition id="DecemberEpisode16ENBright" component={DecemberEpisode16ENBright} durationInFrames={EP16_CONFIG.totalFrames} fps={30} width={1080} height={1920} />
"""

if "DecemberEpisodesRegistry" not in content:
    content = import_statement + "\n" + content

lines = content.splitlines(keepends=True)
out_lines = []
inserted = False

for i, line in enumerate(lines):
    out_lines.append(line)
    if not inserted and 'DecemberEpisode02UpiENBright' in "".join(lines[max(0, i-6):i+1]) and line.strip() == '/>':
        out_lines.append(compositions_block + "\n")
        inserted = True

with open(ROOT_PATH, "w", encoding="utf-8") as f:
    f.writelines(out_lines)

print("Updated Root.jsx successfully, inserted:", inserted)
