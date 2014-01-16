/*
 * DTURLConnection.m
 *
 * NSURLConnection subclass allows the association of data to a connection
 * Useful for concurrent multiple request within a single object
 *
 */


@interface DTURLConnection () {
    NSMutableDictionary *_data;
}

@end

@implementation DTURLConnection

#pragma mark - LIFE CYCLE

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate {
    
	self = [super initWithRequest:request delegate:delegate];
	if(self) {
		_data = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@: %d data", [super description], [_data count]];
}

#pragma mark - PROPERTIES

- (void)setMetaObject:(id)object forKey:(NSString *)key {
    
    /* Add or replace a meta info property */
	if((nil != object) && (nil != key) ){
		[_data setObject:object forKey:key];
	}	
}

- (id)metaObjectForKey:(NSString*)key {
    
	id result = nil;
	if(key) {
		result = [_data objectForKey:key];
	}
	return result;	
}

- (void)removeMetaObjectForKey:(NSString *)key {
    
	if(nil != key){
		[_data removeObjectForKey:key];
	}	
}

#pragma mark - CLEANUP CREW

- (void)dealloc {
    
#if __has_feature(objc_arc)
#else
	[_data release];
	[super dealloc];
#endif
}

@end
