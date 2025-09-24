void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_LOCATED(BOOL,__IX0_0,data__->PB1,retain)
  __INIT_LOCATED_VALUE(data__->PB1,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_1,data__->PB2,retain)
  __INIT_LOCATED_VALUE(data__->PB2,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_2,data__->S1,retain)
  __INIT_LOCATED_VALUE(data__->S1,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_3,data__->S2,retain)
  __INIT_LOCATED_VALUE(data__->S2,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_4,data__->S3,retain)
  __INIT_LOCATED_VALUE(data__->S3,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_0,data__->VALVEA,retain)
  __INIT_LOCATED_VALUE(data__->VALVEA,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_4,data__->VALVEB,retain)
  __INIT_LOCATED_VALUE(data__->VALVEB,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_2,data__->VALVEC,retain)
  __INIT_LOCATED_VALUE(data__->VALVEC,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_3,data__->M0_0,retain)
  __INIT_LOCATED_VALUE(data__->M0_0,__BOOL_LITERAL(FALSE))
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  __SET_LOCATED(data__->,M0_0,,(__GET_LOCATED(data__->PB1,) && __GET_LOCATED(data__->S1,)));
  __SET_LOCATED(data__->,VALVEA,,__GET_LOCATED(data__->M0_0,));
  __SET_LOCATED(data__->,VALVEB,,(__GET_LOCATED(data__->PB2,) || __GET_LOCATED(data__->S2,)));
  __SET_LOCATED(data__->,VALVEC,,!(__GET_LOCATED(data__->S3,)));

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





