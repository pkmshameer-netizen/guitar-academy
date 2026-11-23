# Aamis Guitar – Family Edition

**Version:** v1.0.0  
**Release date:** 2026-11-23

A colorful, mobile-friendly acoustic guitar learning prototype for five family learners:
Aamina, Izza, Aamil, Naseeba and Shameer.

## What's included
- Five named learner profiles with individual color themes.
- Individual lesson progress, stars and chord practice records in this browser's local storage.
- Lesson flow with Learn → Explore activity → Practice checkpoint → 3-question quiz → completion reward.
- A lesson only earns 10 stars after the learner completes the activity and practice checkboxes and passes at least 2 of 3 quiz questions.
- Resume/exit before completion without awarding stars.
- Undo last lesson completion for the currently selected learner.
- Family progress view, chord library, songs and practice tools.

## Preview locally
Open `index.html` in a modern browser. Progress is stored locally in that browser and is not yet synchronized between devices. Microphone-based tuning requires a secure context (HTTPS or localhost) and microphone permission.

## Publish with GitHub Pages
Upload the contents of this folder to the root of the `main` branch in your GitHub repository. Keep `index.html` at the repository root. GitHub Pages should be configured to deploy from `main` / root.

## Important limitations
This is still the browser-only prototype. Supabase authentication and cloud synchronization have not been connected. Local browser storage is not a secure account system and should not be used for sensitive information. The quiz and practice checkboxes are learning checkpoints; they do not use microphone-based performance verification.

## Version history
- **v1.0.0 (2026-11-23):** Introduced staged Duolingo-style lessons with activity and practice checkpoints, a 3-question quiz, completion rewards, and undo-last-completion support.
