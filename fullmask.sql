CREATE OR REPLACE FUNCTION custom_mask(input_text text, mask_character text)
RETURNS text AS $$
DECLARE
masked_text text := '';
i int;
BEGIN
FOR i IN 1..length(input_text) LOOP
masked_text := masked_text || mask_character;
END LOOP;

RETURN masked_text;
END;
$$ LANGUAGE plpgsql;


/* use:  */

/*   for 1 column:   */
    
UPDATE table SET column_name = custom_mask(column_name, '*');


/*  for multiple columns:  */
    
UPDATE table SET
    column_name1 = custom_mask(column_name1, '*'),
    column_name2 = custom_mask(column_name2, '*'),
    column_name3 = custom_mask(column_name3, '*');

