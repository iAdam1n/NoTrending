#import <version.h>

%group iOS11 //iOS 11 code by AndyWiik
@interface ThingView : UIView
- (BOOL)isSelectable;
@end

%hook AppStoreBaseSearch
- (void)setIsTrendingEnabled:(BOOL)enabled {
	%orig(NO);
}
- (BOOL)isTrendingEnabled {
	return NO;
}

- (void)layoutSubviews {
	%orig;
	for (UIView *view in [self subviews]) {
		if ([view respondsToSelector:@selector(isSelectable)]) {
			if (![(ThingView *)view isSelectable]) {
				view.hidden = YES;
				view.alpha = 0;
			}
		}
	}
}
%end
%end

%group iOS10
%hook SKUITrendingSearchView
	-(void)setTrendingSearchViews:(id)arg1 {
		%orig(nil);
	}
	-(void)setTrendingTitleView:(id)arg1 {
		%orig(nil);
	}
%end
%end

%group iOS8
%hook SKUITrendingSearchView
	-(void)layoutSubviews {
		NO;
	}
%end
%end

%ctor {
	if (IS_IOS_OR_NEWER(iOS_11_0) {
        %init(iOS11,AppStoreBaseSearch=objc_getClass("AppStore.BaseSearchContainer"));
    } else if (IS_IOS_OR_NEWER(iOS_10_0) {
        %init(iOS10);
    } 
    else {
        %init(iOS8);
    }
