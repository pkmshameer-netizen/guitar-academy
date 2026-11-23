# Aamis Guitar — Family Edition (Preview)

A responsive, gamified family guitar-learning website prototype for Aamis Guitar for three child beginners and two adult beginners.

## Preview locally
1. Extract the ZIP package.
2. Open `index.html` in a modern browser.
3. Choose any learner profile and explore Home, Learn, Chords, Tuner, Songs and Family.
4. Lesson completions, chord practice and family totals are saved in this browser using `localStorage`.

**Preview mode only:** this version does not require Supabase and does not yet synchronize data between devices. Clearing browser data will remove preview progress. Do not use sensitive information in this local demo.

## Included features
- Five sample learner profiles (Child 1–3, Adult 1–2)
- Family progress dashboard and CSV export
- Ten beginner lessons with lesson unlocking, stars, confetti and milestone celebrations
- Chord diagrams and practice tracking for Em, Am, G, C and D
- Browser microphone tuner (microphone access requires HTTPS or localhost)
- Beginner song examples with chord progressions
- Responsive desktop and mobile navigation

## Later: connect Supabase and publish
The next development step is to connect the existing Supabase project, create secure row-level-security policies, and replace local preview storage with cloud persistence. Then upload the website files to the `guitar-academy` GitHub repository and enable GitHub Pages.

Never put a Supabase service-role key or database password in browser code or a public GitHub repository. Use only the public anon/publishable key after RLS policies have been configured and tested.
