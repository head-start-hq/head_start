'use strict';

module.exports = {
  root: true,
  plugins: ['prettier', '@typescript-eslint'],
  extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended', 'prettier'],
  reportUnusedDisableDirectives: true,
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 2020,
    sourceType: 'module',
  },
  env: {
    browser: true,
  },
  overrides: [
    {
      files: ['.eslintrc.cjs', '.prettierrc.cjs', 'esbuild.config.mjs', 'postcss.config.cjs', 'tailwind.config.cjs'],
      env: {
        node: true,
      },
    },
  ],
  rules: {
    'prettier/prettier': ['error'],
  },
};
