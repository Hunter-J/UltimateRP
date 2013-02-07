ppEffectDestroy ppColor;
ppEffectDestroy ppBlur;
ppEffectDestroy ppInversion;
ppEffectDestroy ppGrain;

ppGrain = ppEffectCreate ["filmGrain", 2005];
ppGrain ppEffectEnable true;
ppGrain ppEffectAdjust [0.02, 1, 1, 0, 1];
ppGrain ppEffectCommit 0;

ppInversion = ppEffectCreate ["colorInversion", 2555];
ppInversion ppEffectEnable true;
ppInversion ppEffectAdjust [0.1,0.1,0.1];
ppInversion ppEffectCommit 0;

ppColor = ppEffectCreate ["ColorCorrections", 1999];
ppColor ppEffectEnable true;
ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [1, 1, 1, 1.0]];
ppColor ppEffectCommit 0;
ppBlur = ppEffectCreate ["dynamicBlur", 505];
ppBlur ppEffectEnable true;  
ppBlur ppEffectAdjust [.5];
ppBlur ppEffectCommit 0;