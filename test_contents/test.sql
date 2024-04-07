select
  *
from
  test_table
where
  id in (1, 2, 3);

select
  *
from
  test_table
where
  id in (4, 5, 6);

insert into
  test_table (id, name)
values
  (7, 'test7');
