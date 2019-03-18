WITH chain_insert(chain_id) AS (
    INSERT INTO timetable.task_chain 
        (chain_id,  parent_id,  task_id,    run_uid,    database_connection,    ignore_error)
    VALUES 
        (DEFAULT,   NULL,       1,          NULL,       NULL,                   TRUE)
    RETURNING chain_id
)
INSERT INTO timetable.chain_execution_config VALUES 
(
    DEFAULT, -- chain_execution_config, 
    chain_insert.chain_id, -- chain_id, 
    'execute noop every minute', -- chain_name, 
    NULL, -- run_at_minute, 
    NULL, -- run_at_hour, 
    NULL, -- run_at_day, 
    NULL, -- run_at_month,
    NULL, -- run_at_day_of_week, 
    1, -- max_instances, 
    TRUE, -- live, 
    FALSE, -- self_destruct,
	FALSE. -- exclusive_execution, 
    NULL -- excluded_execution_configs
);


