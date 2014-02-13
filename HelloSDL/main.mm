//
//  main.mm
//  HelloSDL
//
//  Created by burt on 2014. 2. 13..
//  Copyright (c) 2014년 burt. All rights reserved.
//

#include "main.h"
#include <SDL/SDL.h>
#include "SDLMain.h"

int main(int argc, char **argv)
{
	//The images
    SDL_Surface* hello = NULL;
    SDL_Surface* screen = NULL;
	
    //Start SDL
    SDL_Init( SDL_INIT_EVERYTHING );
	
    //Set up screen
    screen = SDL_SetVideoMode( 640, 480, 32, SDL_SWSURFACE );
	
	NSString * file = [[NSBundle mainBundle] pathForResource:@"hello.bmp" ofType:nil];
    //Load image
    hello = SDL_LoadBMP( [file UTF8String] );
	
	if(hello == NULL)
	{
		std::cout << "BMP file not found" << std::endl;
		SDL_Quit();
		return -1;
	}
    //Apply image to screen
    SDL_BlitSurface( hello, NULL, screen, NULL );
	
    //Update Screen
    SDL_Flip( screen );
	
    //Pause
    SDL_Delay( 10000 );
	
    //Free the loaded image
    SDL_FreeSurface( hello );
	
    //Quit SDL
    SDL_Quit();
	
    return 0;
}