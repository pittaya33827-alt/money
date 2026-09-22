# Supabase Setup for Money Plan

## 1) Create table
Run the SQL in `supabase/migrations/001_create_money_plan.sql` in the Supabase SQL editor.

## 2) Deploy edge function
From the Supabase dashboard:
- Go to Edge Functions
- Create a function named `sync-money-plan`
- Replace the generated file with the contents from `supabase/functions/sync-money-plan/index.ts`
- Set environment variable `SUPABASE_SERVICE_ROLE_KEY`

## 3) Frontend usage
Call the function using the browser fetch API with the Supabase project URL and the function name.

Example:

```js
const response = await fetch('https://mmsitxzplollkvujbjsk.supabase.co/functions/v1/sync-money-plan', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    id: '0956640980zaZX',
    data: { ...localState }
  })
});
```

This is safer than writing directly from browser with the secret key.
