#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

__DECLARE_ENUMERATED_TYPE(LOGLEVEL,
  LOGLEVEL__CRITICAL,
  LOGLEVEL__WARNING,
  LOGLEVEL__INFO,
  LOGLEVEL__DEBUG
)
// PROGRAM PROGRAM0
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables

  // PROGRAM private variables - TEMP, private and located variables
  __DECLARE_LOCATED(BOOL,PB1)
  __DECLARE_LOCATED(BOOL,PB2)
  __DECLARE_LOCATED(BOOL,S1)
  __DECLARE_LOCATED(BOOL,S2)
  __DECLARE_LOCATED(BOOL,S3)
  __DECLARE_LOCATED(BOOL,VALVEA)
  __DECLARE_LOCATED(BOOL,VALVEB)
  __DECLARE_LOCATED(BOOL,VALVEC)
  __DECLARE_LOCATED(BOOL,M0_0)

} PROGRAM0;

void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain);
// Code part
void PROGRAM0_body__(PROGRAM0 *data__);
#endif //__POUS_H
