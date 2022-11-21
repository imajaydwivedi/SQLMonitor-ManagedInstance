CREATE EVENT SESSION [resource_consumption] ON SERVER 
ADD EVENT sqlserver.rpc_completed(SET collect_statement=(0)
    ACTION(sqlos.scheduler_id,sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.database_name,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.server_principal_name,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([package0].[not_equal_uint64]([sqlserver].[database_id],(32767)) AND [package0].[greater_than_uint64]([duration],(5000000)))),
ADD EVENT sqlserver.sp_statement_completed(
    ACTION(sqlos.scheduler_id,sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.database_name,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.server_principal_name,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([package0].[not_equal_uint64]([sqlserver].[database_id],(32767)) AND [package0].[greater_than_int64]([duration],(5000000)))),
ADD EVENT sqlserver.sql_batch_completed(SET collect_batch_text=(0)
    ACTION(sqlos.scheduler_id,sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.database_name,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.server_principal_name,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([package0].[not_equal_uint64]([sqlserver].[database_id],(32767)) AND [package0].[greater_than_uint64]([duration],(5000000))))
ADD TARGET package0.event_file(SET filename=N'E:\XEvent\resource_consumption',max_file_size=(2048),max_rollover_files=(10))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=ON,STARTUP_STATE=ON)
GO


