void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_LOCATED(BOOL,__IX0_0,data__->IX00,retain)
  __INIT_LOCATED_VALUE(data__->IX00,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_1,data__->IX01,retain)
  __INIT_LOCATED_VALUE(data__->IX01,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_2,data__->IX02,retain)
  __INIT_LOCATED_VALUE(data__->IX02,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_3,data__->IX03,retain)
  __INIT_LOCATED_VALUE(data__->IX03,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_4,data__->IX04,retain)
  __INIT_LOCATED_VALUE(data__->IX04,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_0,data__->QX00,retain)
  __INIT_LOCATED_VALUE(data__->QX00,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_1,data__->QX01,retain)
  __INIT_LOCATED_VALUE(data__->QX01,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_2,data__->QX02,retain)
  __INIT_LOCATED_VALUE(data__->QX02,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_3,data__->QX03,retain)
  __INIT_LOCATED_VALUE(data__->QX03,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_4,data__->QX04,retain)
  __INIT_LOCATED_VALUE(data__->QX04,__BOOL_LITERAL(FALSE))
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  __SET_LOCATED(data__->,QX04,,(__GET_LOCATED(data__->QX04,) || (__GET_LOCATED(data__->IX00,) && !(__GET_LOCATED(data__->IX01,)))));
  __SET_LOCATED(data__->,QX00,,(__GET_LOCATED(data__->QX04,) && __GET_LOCATED(data__->IX02,)));
  __SET_LOCATED(data__->,QX00,,__GET_LOCATED(data__->IX04,));
  __SET_LOCATED(data__->,QX01,,(__GET_LOCATED(data__->QX00,) && __GET_LOCATED(data__->IX03,)));
  __SET_LOCATED(data__->,QX02,,((__GET_LOCATED(data__->QX04,) && __GET_LOCATED(data__->QX01,)) && !(__GET_LOCATED(data__->QX03,))));
  __SET_LOCATED(data__->,QX03,,((__GET_LOCATED(data__->QX04,) && __GET_LOCATED(data__->IX02,)) && __GET_LOCATED(data__->QX02,)));

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





