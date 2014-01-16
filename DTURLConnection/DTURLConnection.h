/*
 * DTURLConnection.h
 *
 * Allows the association of data to a connection
 *
 * Use for concurrent multiple request within a single object
 *
 */

#import <Foundation/Foundation.h>

@interface DTURLConnection : NSURLConnection {
    
}

/* add/replace info */
- (void)setMetaObject:(id)object forKey:(NSString*)key;

/* get info */
- (id)metaObjectForKey:(NSString*)key;

/* remove info */
- (void)removeMetaObjectForKey:(NSString*)key;

@end
