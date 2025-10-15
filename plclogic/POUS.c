void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_VAR(data__->PB1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CURRENT_STATE,0,retain)
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  {
    INT __case_expression = __GET_VAR(data__->CURRENT_STATE,);
    if ((__case_expression == 0)) {
      __SET_VAR(data__->,CURRENT_STATE,,1);
    }
    else if ((__case_expression == 1)) {
      __SET_VAR(data__->,CURRENT_STATE,,2);
    }
    else if ((__case_expression == 2)) {
      __SET_VAR(data__->,CURRENT_STATE,,0);
    }
  };

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





