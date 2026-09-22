create table if not exists public.money_plan (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.money_plan enable row level security;

create policy if not exists "Allow public read/write for money_plan"
  on public.money_plan
  for all
  using (true)
  with check (true);

create index if not exists money_plan_updated_at_idx
  on public.money_plan (updated_at desc);
