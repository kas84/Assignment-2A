//
//  PolygonShape.m
//  WhatAToool
//
//  Created by Pablo Caselas Pedreira on 12/02/10.
//  Copyright 2010 ICEX. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

-(id) initWithNumberOfSides:(int) sides minimumNumberOfSides:(int) min maximumNumberOfSides:(int) max{
	if ([super init]){
		[self setMinimumNumberOfSides:min];
		[self setMaximumNumberOfSides:max];
		[self setNumberOfSides:sides];
	}
	return self;
}
-(id) init{
	[self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
	return self;
}


@synthesize numberOfSides;
-(void) setNumberOfSides:(int) sides{
	if (sides>=minimumNumberOfSides){	
		if (sides<=maximumNumberOfSides){
			numberOfSides=sides;
		}
		else{
			NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed",sides,maximumNumberOfSides);
		}
	}
	else{
		NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed",sides,minimumNumberOfSides);
	}
}

@synthesize minimumNumberOfSides;
-(void) setMinimumNumberOfSides:(int) sides{
	if (sides>2){
		minimumNumberOfSides=sides;
	}
	else{
		NSLog(@"The number of sides has to be greater than 2");
	}
}
@synthesize maximumNumberOfSides;
-(void) setMaximumNumberOfSides:(int) sides{
	if (sides<=12){
		maximumNumberOfSides=sides;
	}
	else{
		NSLog(@"The number of sides has to be equal or less than 12");
	}
}

- (float)angleInDegrees {
	return (180*(numberOfSides-2)/numberOfSides);
}

- (float)angleInRadians {
	return ([self angleInDegrees]*(M_PI/180));
}

- (NSString *) name {
	if (numberOfSides == 3)
		return @"Triangle";
	
	if (numberOfSides == 4)
		return @"Square";
	
	if (numberOfSides == 5)
		return @"Pentagon";
	
	if (numberOfSides == 6)
		return @"Hexagon";
	
	if (numberOfSides == 7)
		return @"Heptagon";
	
	if (numberOfSides == 8)
		return @"Octogon";
	
	if (numberOfSides == 9)
		return @"Nonagon";
	
	if (numberOfSides == 10)
		return @"Decagon";
	
	if (numberOfSides == 11)
		return @"Hendecagon";
	
	if (numberOfSides == 12)
		return @"Dodecagon";
	return @"";
}

- (NSString *) description {
	return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).", [self numberOfSides], [self name], [self angleInDegrees], [self angleInRadians]];
}

- (void)dealloc{
	NSLog(@"deallocating");
	[super dealloc];
}
@end
