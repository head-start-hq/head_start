import esbuild from 'esbuild';

const config = {
  entryPoints: ['./app/javascript/*.ts'],
  bundle: true,
  outdir: './app/assets/builds/',
  sourcemap: true,
  format: 'esm',
  target: 'es2017',
  define: {
    // Floating UI requires this to be set
    'process.env.NODE_ENV': '"production"',
  },
};

if (process.argv.includes('--watch')) {
  const ctx = await esbuild.context(config);
  await ctx.watch();
} else {
  await esbuild.build(config);
}
