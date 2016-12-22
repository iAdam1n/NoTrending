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
    if (kCFCoreFoundationVersionNumber > 1300) {
        %init(iOS10);
    } else {
        %init(iOS8);
    }
}