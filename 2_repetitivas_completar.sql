-- EJERCICIO 1
/* 
  Autor: ivan
 Fecha: 25/02/2020
 Descripcion: saca los valores de uno hasta 3
*/
-- LOOP
set SERVEROUTPUT ON;
Declare
    LN$I pls_integer := 0 ;
Begin
    Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
        exit when LN$I > 2 ;
    End loop ;
End ;

-- EJERCICIO 2
/* 
  Autor: ivan
 Fecha: 25/02/2020
 Descripcion: repetitiva que mmuestra valor hasta que la variable  sea 3
*/
-- WHILE
Declare
      LN$I pls_integer := 0 ;
Begin
    While LN$I < 3
      Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
      End loop ;
End ;

-- EJERCICIO 3
/* 
  Autor: ivan
 Fecha: 25/02/2020
 Descripcion: corregido
*/
--FOR

Begin
    -- FOR de 3 a 1
    For i in reverse 1..3
      Loop
        dbms_output.put_line( to_char( i ) ) ;
      End loop ;
  End ;


-- EJERCICIO 4
/* 
  Autor: ivan
 Fecha: 25/02/2020
 Descripcion: corregido
*/
-- FOR  de 1 a 3 

Begin
    -- FOR de 3 a 1
    For i in  1..3
      Loop
        dbms_output.put_line( to_char( i ) ) ;
      End loop ;
  End ;