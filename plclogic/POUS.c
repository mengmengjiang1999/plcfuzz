void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_VAR(data__->PB1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CSTATE92,0,retain)
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  {
    LINT __case_expression = __GET_VAR(data__->CSTATE92,);
    if ((__case_expression == 0)) {
      if (__BOOL_LITERAL(TRUE)) {
        __SET_VAR(data__->,CSTATE92,,1);
        __SET_VAR(data__->,LED,,__BOOL_LITERAL(FALSE));
        __SET_VAR(data__->,LED2,,__BOOL_LITERAL(FALSE));
      };
    }
    else if ((__case_expression == 1)) {
      if ((__GET_VAR(data__->PB1,) == __BOOL_LITERAL(FALSE))) {
        __SET_VAR(data__->,CSTATE92,,1);
        __SET_VAR(data__->,LED,,__BOOL_LITERAL(TRUE));
        __SET_VAR(data__->,LED2,,__BOOL_LITERAL(FALSE));
      } else if ((__GET_VAR(data__->PB1,) == __BOOL_LITERAL(TRUE))) {
        __SET_VAR(data__->,CSTATE92,,2);
        __SET_VAR(data__->,LED,,__BOOL_LITERAL(TRUE));
        __SET_VAR(data__->,LED2,,__BOOL_LITERAL(FALSE));
      };
    }
    else if ((__case_expression == 2)) {
      if ((__GET_VAR(data__->PB1,) == __BOOL_LITERAL(FALSE))) {
        __SET_VAR(data__->,CSTATE92,,3);
        __SET_VAR(data__->,LED,,__BOOL_LITERAL(TRUE));
        __SET_VAR(data__->,LED2,,__BOOL_LITERAL(TRUE));
      } else if ((__GET_VAR(data__->PB1,) == __BOOL_LITERAL(TRUE))) {
        __SET_VAR(data__->,CSTATE92,,4);
        __SET_VAR(data__->,LED,,__BOOL_LITERAL(TRUE));
        __SET_VAR(data__->,LED2,,__BOOL_LITERAL(TRUE));
      };
    }
    else if ((__case_expression == 3)) {
      if (__BOOL_LITERAL(TRUE)) {
        __SET_VAR(data__->,CSTATE92,,1);
        __SET_VAR(data__->,LED,,__BOOL_LITERAL(FALSE));
        __SET_VAR(data__->,LED2,,__BOOL_LITERAL(FALSE));
      };
    }
    else if ((__case_expression == 4)) {
      if (__BOOL_LITERAL(TRUE)) {
        __SET_VAR(data__->,CSTATE92,,3);
        __SET_VAR(data__->,LED,,__BOOL_LITERAL(FALSE));
        __SET_VAR(data__->,LED2,,__BOOL_LITERAL(TRUE));
      };
    }
  };

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





