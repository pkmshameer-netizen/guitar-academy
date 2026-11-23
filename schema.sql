-- Run this entire script in Supabase: SQL Editor -> New query -> Run.
create extension if not exists pgcrypto;

create table if not exists public.guitar_profiles (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  display_name text not null check (char_length(display_name) between 1 and 50),
  learner_type text not null default 'child' check (learner_type in ('child','adult')),
  avatar text not null default '🎸',
  created_at timestamptz not null default now()
);
create table if not exists public.guitar_lesson_progress (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.guitar_profiles(id) on delete cascade,
  lesson_number integer not null check (lesson_number between 1 and 10),
  completed boolean not null default false,
  completed_at timestamptz,
  unique(profile_id, lesson_number)
);
create table if not exists public.guitar_practice_sessions (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.guitar_profiles(id) on delete cascade,
  duration_minutes integer not null check (duration_minutes between 1 and 240),
  note text check (note is null or char_length(note) <= 180),
  practiced_at timestamptz not null default now()
);
create table if not exists public.guitar_chord_mastery (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.guitar_profiles(id) on delete cascade,
  chord_name text not null check (chord_name in ('Em','Am','G','C','D','E','A')),
  mastered boolean not null default true,
  unique(profile_id, chord_name)
);

alter table public.guitar_profiles enable row level security;
alter table public.guitar_lesson_progress enable row level security;
alter table public.guitar_practice_sessions enable row level security;
alter table public.guitar_chord_mastery enable row level security;

-- Every signed-in family account can access only profiles it owns and data attached to those profiles.
drop policy if exists "family owns profiles" on public.guitar_profiles;
create policy "family owns profiles" on public.guitar_profiles for all to authenticated
using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "family owns lesson progress" on public.guitar_lesson_progress;
create policy "family owns lesson progress" on public.guitar_lesson_progress for all to authenticated
using (exists (select 1 from public.guitar_profiles p where p.id = profile_id and p.user_id = auth.uid()))
with check (exists (select 1 from public.guitar_profiles p where p.id = profile_id and p.user_id = auth.uid()));

drop policy if exists "family owns practice sessions" on public.guitar_practice_sessions;
create policy "family owns practice sessions" on public.guitar_practice_sessions for all to authenticated
using (exists (select 1 from public.guitar_profiles p where p.id = profile_id and p.user_id = auth.uid()))
with check (exists (select 1 from public.guitar_profiles p where p.id = profile_id and p.user_id = auth.uid()));

drop policy if exists "family owns chord mastery" on public.guitar_chord_mastery;
create policy "family owns chord mastery" on public.guitar_chord_mastery for all to authenticated
using (exists (select 1 from public.guitar_profiles p where p.id = profile_id and p.user_id = auth.uid()))
with check (exists (select 1 from public.guitar_profiles p where p.id = profile_id and p.user_id = auth.uid()));

grant usage on schema public to authenticated;
grant select, insert, update, delete on public.guitar_profiles to authenticated;
grant select, insert, update, delete on public.guitar_lesson_progress to authenticated;
grant select, insert, update, delete on public.guitar_practice_sessions to authenticated;
grant select, insert, update, delete on public.guitar_chord_mastery to authenticated;
