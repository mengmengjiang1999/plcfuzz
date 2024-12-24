//-----------------------------------------------------------------------------
// Copyright 2015 Thiago Alves
//
// Based on the LDmicro software by Jonathan Westhues
// This file is part of the OpenPLC Software Stack.
//
// OpenPLC is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// OpenPLC is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with OpenPLC.  If not, see <http://www.gnu.org/licenses/>.
//------
//
// This file is the hardware layer for the OpenPLC. If you change the platform
// where it is running, you may only need to change this file. All the I/O
// related stuff is here. Basically it provides functions to read and write
// to the OpenPLC internal buffers in order to update I/O state.
// Thiago Alves, Dec 2015
//-----------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include<iostream>

#include "ladder.h"
#include "custom_layer.h"

//-----------------------------------------------------------------------------
// This function is called by the main OpenPLC routine when it is initializing.
// Hardware initialization procedures should be here.
//-----------------------------------------------------------------------------
void initializeHardware()
{
	printf("Initializing hardware layer...\n");
	for(int i = 0; i < BUFFER_SIZE; i++){
		for(int j = 0; j < 8; j++){
			bool_input[i][j] = new IEC_BOOL;
		}
	}

	for(int i = 0; i < BUFFER_SIZE; i++){
		for(int j = 0; j < 8; j++){
			bool_output[i][j] = new IEC_BOOL;
		}
	}
}

//-----------------------------------------------------------------------------
// This function is called by the main OpenPLC routine when it is finalizing.
// Resource clearing procedures should be here.
//-----------------------------------------------------------------------------
void finalizeHardware()
{
}

//-----------------------------------------------------------------------------
// This function is called by the OpenPLC in a loop. Here the internal buffers
// must be updated to reflect the actual Input state. The mutex bufferLock
// must be used to protect access to the buffers on a threaded environment.
//-----------------------------------------------------------------------------



// 写输入数据，从标准输入中模拟

void updateBuffersIn()
{
	printf("Get input values:\n");
	pthread_mutex_lock(&bufferLock); //lock mutex

	/*********READING AND WRITING TO I/O**************

	*bool_input[0][0] = read_digital_input(0);
	write_digital_output(0, *bool_output[0][0]);

	*int_input[0] = read_analog_input(0);
	write_analog_output(0, *int_output[0]);

	**************************************************/

	for(int i = 0; i < BUFFER_SIZE; i++){
		for(int j = 0; j < 8; j++){
			IEC_BOOL value;
			std::cin>>value;
			printf("Input buffer: %d,%d, %hhu\n", i, j, value);
			// if(scanf("%hhu", &value) != 1){
			// 	printf("Error reading input buffer\n");
			// }else{
			// 	printf("Input buffer: %hhu\n", value);
			// }
			*bool_input[i][j] = value;
		}
	}

	pthread_mutex_unlock(&bufferLock); //unlock mutex
}

//-----------------------------------------------------------------------------
// This function is called by the OpenPLC in a loop. Here the internal buffers
// must be updated to reflect the actual Output state. The mutex bufferLock
// must be used to protect access to the buffers on a threaded environment.
//-----------------------------------------------------------------------------
void updateBuffersOut()
{
	printf("update output values:\n");
	pthread_mutex_lock(&bufferLock); //lock mutex

	printf("in mutex output values\n");

	/*********READING AND WRITING TO I/O**************

	*bool_input[0][0] = read_digital_input(0);
	write_digital_output(0, *bool_output[0][0]);

	*int_input[0] = read_analog_input(0);
	write_analog_output(0, *int_output[0]);

	**************************************************/

	for(int i = 0; i < BUFFER_SIZE; i++){
		for(int j = 0; j < 8; j++){
			printf("i=%d, j=%d\n", i, j);

			if(*bool_output[i][j] == NULL){
				printf("output buffer is null\n");
			}else{
				printf("output buffer: %d,%d, %hhu\n", i, j, *bool_output[i][j]);

				std::cout<<*bool_output[i][j]<<" ";
				printf("\n");
				// if(printf("%hhu", *bool_output[i][j]) != 1){
				// 	printf("Error writing output buffer\n");
				// }else{
				// 	printf("Output buffer: %d,%d, %hhu\n", i, j, *bool_output[i][j]);
				// }
				// printf("\n ");
			}


		}
	}

	printf("out mutex output values\n");

	pthread_mutex_unlock(&bufferLock); //unlock mutex

	printf("end update output values\n");
}

