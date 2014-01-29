@interface NSString (Cool)

- (BOOL) isBlank;

- (BOOL) contains:(NSString*)other;

- (BOOL) endsWith:(NSString*)other;

- (NSString*) encodeURL;

@end
