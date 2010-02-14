#import <Foundation/Foundation.h>
#import "PolygonShape.h"
void PrintPathInfo(){
	NSString *path = [@"~" stringByExpandingTildeInPath];
	NSLog(@"Mi carpeta home es '%@'",path);
}
void PrintProcessInfo(){
	NSString *processName = [[NSProcessInfo processInfo] processName];
	int processId=[[NSProcessInfo processInfo]processIdentifier];
	NSLog(@"ProcessName: '%@' Process ID '%d'",processName,processId);
}
void PrintBookmarkInfo(){
	NSMutableDictionary *diccionario= [NSMutableDictionary dictionary];
	[diccionario setObject:[NSURL URLWithString:@"http://www.stanford.edu"] forKey:@"Stanford University"];
	[diccionario setObject:[[NSURL alloc] initWithString:@"http://www.apple.com"] forKey:@"Apple"];
	[diccionario setObject:[[NSURL alloc] initWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
	[diccionario setObject:[[NSURL alloc] initWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
	[diccionario setObject:[[NSURL alloc] initWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mail"];
	NSURL *url;
	for (NSString *key in diccionario){
		if ([key hasPrefix:@"Stanford"]){
			url=[diccionario objectForKey:key];
			NSLog(@"Key: '%@' URL: '%@'",key,url);
		}
	}
}

void PrintIntrospectionInfo(){
	NSMutableArray *array = [NSMutableArray array];
	NSString *objeto1 = @"eres tonto!";
	NSProcessInfo *proceso= [NSProcessInfo processInfo];
	NSMutableDictionary *diccionario= [NSMutableDictionary dictionary];
	[diccionario setObject:[NSURL URLWithString:@"http://www.stanford.edu"] forKey:@"Stanford University"];
	[diccionario setObject:[[NSURL alloc] initWithString:@"http://www.apple.com"] forKey:@"Apple"];
	[diccionario setObject:[[NSURL alloc] initWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
	[array addObject:proceso];
	[array addObject:objeto1];
	[array addObject:[NSProcessInfo processInfo]];
	[array addObject:diccionario];
	SEL lowercase=@selector(lowercaseString);
	for (int i=0;i<[array count];i++){
		NSLog(@"Class Name: %@",[[array objectAtIndex:i] className]);
		NSLog(@"Is member of NSString: %@",[[array objectAtIndex:i] isMemberOfClass:[NSString class]]?@"YES":@"NO");
		NSLog(@"Is kind of NSString: %@",[[array objectAtIndex:i] isKindOfClass:[NSString class]]?@"YES":@"NO");
		NSLog(@"Responds to lowercaseString: %@",[[array objectAtIndex:i] respondsToSelector:lowercase]?@"YES":@"NO");
		NSLog(@"============================================");
	}
}

void PrintPolygon(){
	NSMutableArray *array =[NSMutableArray array];
	PolygonShape *polygon1= [[PolygonShape alloc] init];
	[polygon1 autorelease];
	PolygonShape *polygon2= [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7];
	[polygon2 autorelease];
	PolygonShape *polygon3 =[[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
	[polygon3 autorelease];
	PolygonShape *polygon4 =[[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
	[polygon4 autorelease];
	[array addObject:polygon1];
	[array addObject:polygon2];
	[array addObject:polygon3];
	[array addObject:polygon4];
	for (int i =0; i<[array count]; i++){
		PolygonShape *polygon=[array objectAtIndex:i];
		NSLog([polygon description]);
	}
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
    // insert code here...
	PrintPathInfo();
	PrintProcessInfo();
	PrintBookmarkInfo();
	PrintIntrospectionInfo();
	PrintPolygon();
    [pool release];
    return 0;
}
