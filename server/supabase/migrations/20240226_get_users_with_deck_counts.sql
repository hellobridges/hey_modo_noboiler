-- Create a function to get users with their deck counts
CREATE OR REPLACE FUNCTION public.get_users_with_deck_counts()
RETURNS TABLE (
  id uuid,
  email text,
  name text,
  avatar_url text,
  deck_count bigint
) 
LANGUAGE sql
SECURITY DEFINER
AS $$
  SELECT 
    au.id,
    au.email,
    au.raw_user_meta_data->>'name' as name,
    au.raw_user_meta_data->>'avatar_url' as avatar_url,
    COUNT(d.id) as deck_count
  FROM auth.users au
  LEFT JOIN public.fc_decks d ON au.id = d.user_id
  GROUP BY au.id, au.email, au.raw_user_meta_data
  ORDER BY deck_count DESC;
$$; 