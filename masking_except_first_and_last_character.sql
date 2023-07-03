CREATE OR REPLACE FUNCTION custom_masker(input_text text)
RETURNS text AS $$
DECLARE
masked_text text := '';
first_char text := left(input_text, 1);
last_char text := right(input_text, 1);
middle_chars_length int := greatest(length(input_text) - 2, 0);
middle_chars text := repeat('*', middle_chars_length);
BEGIN
masked_text := first_char || middle_chars || last_char;
RETURN masked_text;
END;
$$ LANGUAGE plpgsql;

/*  use:  */


/*  for 1 column:   */

UPDATE table SET column_name = custom_masker(column_name);


/*   for multiple columns:  */

UPDATE table
SET column_name1 = custom_masker(column_name1),
    column_name2 = custom_masker(column_name2),
    column_name3 = custom_masker(column_name3);
