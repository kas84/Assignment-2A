//
//  PolygonShape.h
//  WhatAToool
//
//  Created by Pablo Caselas Pedreira on 12/02/10.
//  Copyright 2010 ICEX. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
}

@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly)float angleInDegrees;
@property (readonly)float angleInRadians;
@property (readonly) NSString *name;

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max; 
- (NSString *)description;
- (void)dealloc;

@end
