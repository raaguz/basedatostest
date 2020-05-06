CREATE OR REPLACE FUNCTION F_GET_NOMBRE_TEST(pv_nombre  IN VARCHAR) RETURN VARCHAR Is

vl_nombre_completo     VARCHAR2(200);
pv_msg_id_o                GB_MESSAGES.msg_id%TYPE;
pv_title_o                     GB_MESSAGES.title%TYPE;

BEGIN
      --- PASO A ---
      BEGIN
            vl_nombre_completo:=pv_nombre || ' TEST 2';

      EXCEPTION
            WHEN NO_DATA_FOUND THEN
                      vl_nombre_completo := NULL;
            WHEN OTHERS THEN
                      pv_msg_id_o := 100000;
                      pv_title_o  := substr (pv_msg_id_o, 1, 1);
                      pkg_traduc.p_inserta_bitacora (pi_msg_id   => pv_msg_id_o,
                                                                    pi_code_err => sqlcode,
                                                                    pi_msg_text => sqlerrm,
                                                                    pi_usuario  => user,
                                                                    pi_programa => 'F_GET_NOMBRE_COMPLETO ---> PASO A' ,
                                                                    pi_tipo     => pv_title_o);
      END;

      RETURN vl_nombre_completo;

END F_GET_NOMBRE_TEST;
/
