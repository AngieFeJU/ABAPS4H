*&---------------------------------------------------------------------*
*& Report zcl3_013
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl3_013.

try.

select from hierarchy( source zsql_cds_01_tree
                       child to parent association _tree
                       start where id = 1
                       siblings order by id ascending

                       multiple parents allowed
                       orphans root
                       cycles breakup )
 fields
    case
        when id is initial then 'INITIAL'
        else cast( id as char )
    end as id,
    case
        when parent is initial then 'INITIAL'
        else cast( parent as char )
    end as parent,
    name,
    hierarchy_tree_size,
    hierarchy_is_cycle,
    hierarchy_is_orphan,
    hierarchy_level,
    hierarchy_parent_rank,
    hierarchy_rank
    into table @data(gt_results).
catch cx_sy_open_sql_db into data(gx_sql_db).
    write gx_sql_db->get_text(  ).
    exit.
endtry.

check gt_results is not initial.
cl_demo_output=>display( gt_results ).
