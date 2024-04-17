*&---------------------------------------------------------------------*
*& Report zsql_08_hierarchy_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_08_hierarchy_macs.

DELETE FROM ztree.

INSERT ztree FROM TABLE @( VALUE #(
                ( id = 1  parent_id = 0 name = 'AA' )
                ( id = 2  parent_id = 1 name = 'AA-AA' )
                ( id = 3  parent_id = 2 name = 'AA-AA-AA' )
                ( id = 4  parent_id = 2 name = 'AA-AA-BB' )
                ( id = 4  parent_id = 21 name = 'AA-AA-BB--4' )
                ( id = 4  parent_id = 33 name = 'AA-AA-BB--4' )
                ( id = 5  parent_id = 1 name = 'AA-BB' )
                ( id = 6  parent_id = 5 name = 'AA-BB-AA' )
                ( id = 7  parent_id = 6 name = 'AA-BB-AA-AA' )
                ( id = ''  parent_id = 6 name = 'AA-BB-AA-BB' )
                ( id = 10 parent_id = 5 name = 'AA-BB-BB ' )
                ( id = 9  parent_id = 9 name = 'AA-BB-BB-AA' )
                ( id = 11 parent_id = 1 name = 'AA-CC' )
                ( id = 12 parent_id = 0 name = 'BB' )
                ( id = 13 parent_id = 0 name = 'CC' )
                ( id = 14 parent_id = 13 name = 'CC-AA' )
                ( id = 15 parent_id = 14 name = 'CC-AA-AA' )
                ( id = 16 parent_id = 50 name = 'CC-AA-BB' )
)
).

TRY.
*start toma el bloque/segmento de la jerarquia que se pide
*Depth 0 permite visualizar los padres de acuerdo a el nivel
*MULTIPLE PARENTS = allowed, not allowed, leaves only.
*  importante sql la relacion  de las formas que forman la clave y la cadinalidad debe ser de 1 a muchos para allowed y only
*ORPHANS permite adopt, error, ignore , root (Encontrar donde tenemos el nodo con el huerfano)
*Nota-> Si se especifica depth, Orphans debe ser ajustado a  IGNORE, el parent_id 0 no es considerado cono huerfano si no se considera el punto de inicio

    SELECT FROM HIERARCHY( SOURCE zsql_cds_01_tree_macs
                       CHILD TO PARENT ASSOCIATION _tree
                       START WHERE id = 1
                       SIBLINGS ORDER BY id ASCENDING
*                       DEPTH 4
                       MULTIPLE PARENTS ALLOWED
                       ORPHANS ROOT
                       CYCLES BREAKUP
                       )
       FIELDS
            CASE WHEN id IS INITIAL THEN 'INITIAL'
                ELSE CAST(  id as char )
            END AS id,
            CASE WHEN parent IS INITIAL THEN 'INITIAL'
                ELSE CAST(  parent as char )
            END AS parent, name,
            hierarchy_is_orphan,
            hierarchy_is_cycle,
            hierarchy_parent_rank,
            hierarchy_tree_size,
            hierarchy_level
       INTO TABLE @DATA(gt_results).



CATCH CX_SY_OPEN_SQL_DB INTO DATA(lx_sql_db).
 WRITE lx_sql_db->get_longtext(  ).
    EXIT.
ENDTRY.

CHECK gt_results IS NOT INITIAL.
 cl_demo_output=>display( gt_results ).

*Se crea una vista CDS, JERARQUI Y PROFUNDIDAD
*Nota->
*    Los CDS usados en una jerarquía no pueden tener restricciones sobre el acceso
*    a los datos con Access Control. Es decir,
*****tu CDS tiene la anotación @Accesscontrol.authorizationcheck: #NOT_REQUIRED. debe ser NOT ALLOWED
*    Te explico lo que realmente hace el valor #NOT_REQUIRED.
*    Durante el tiempo de ejecución de la autorización, se ejecuta una verificación de autorización
*    si existe una función DCL para la entidad. Este comportamiento es el mismo en tiempo de ejecución
*    que el valor #CHECK.
