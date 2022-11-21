select cast(event_data as XML) as event_data, *
from sys.fn_xe_file_target_read_file('E:\XEvent\resource_consumption*.xel', null, null, null)

