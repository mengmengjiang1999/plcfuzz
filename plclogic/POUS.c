void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_LOCATED(BOOL,__IX0_0,data__->PB1,retain)
  __INIT_LOCATED_VALUE(data__->PB1,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_1,data__->PB2,retain)
  __INIT_LOCATED_VALUE(data__->PB2,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_0,data__->LED,retain)
  __INIT_LOCATED_VALUE(data__->LED,__BOOL_LITERAL(FALSE))
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  __SET_LOCATED(data__->,LED,,(!(__GET_LOCATED(data__->PB2,)) && (__GET_LOCATED(data__->LED,) || __GET_LOCATED(data__->PB1,))));

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





