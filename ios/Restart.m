#import "Restart.h"

@implementation Restart

RCT_EXPORT_MODULE(RNRestart)

- (void)loadBundle
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(250, 100, 200, 20)];
    label.text = @"Changing Language";
    [label setBackgroundColor:[UIColor whiteColor]];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    //[window addSubview:label];
    [window bringSubviewToFront:label];
    [window makeKeyAndVisible];
    
    UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    animatedImageView.animationImages = [NSArray arrayWithObjects:
                                         [UIImage imageNamed:@"frame_01"],
                                         [UIImage imageNamed:@"frame_02"],
                                         [UIImage imageNamed:@"frame_03"],
                                         [UIImage imageNamed:@"frame_04"],
                                         [UIImage imageNamed:@"frame_05"],
                                         [UIImage imageNamed:@"frame_06"],
                                         [UIImage imageNamed:@"frame_07"],
                                         [UIImage imageNamed:@"frame_08"],
                                         [UIImage imageNamed:@"frame_09"],
                                         [UIImage imageNamed:@"frame_10"],
                                         [UIImage imageNamed:@"frame_11"],
                                         [UIImage imageNamed:@"frame_12"],
                                         [UIImage imageNamed:@"frame_13"],
                                         [UIImage imageNamed:@"frame_14"],
                                         [UIImage imageNamed:@"frame_15"],
                                         [UIImage imageNamed:@"frame_16"],
                                         [UIImage imageNamed:@"frame_17"],
                                         [UIImage imageNamed:@"frame_18"],
                                         [UIImage imageNamed:@"frame_19"],
                                         [UIImage imageNamed:@"frame_20"],
                                         [UIImage imageNamed:@"frame_21"],
                                         [UIImage imageNamed:@"frame_22"],
                                         [UIImage imageNamed:@"frame_23"],
                                         [UIImage imageNamed:@"frame_24"],
                                         [UIImage imageNamed:@"frame_25"],
                                         [UIImage imageNamed:@"frame_26"],
                                         [UIImage imageNamed:@"frame_27"],
                                         [UIImage imageNamed:@"frame_28"],
                                          [UIImage imageNamed:@"frame_29"],
                                         [UIImage imageNamed:@"frame_30"], nil];
    animatedImageView.animationDuration = 1.0f;
    animatedImageView.animationRepeatCount = 0;
    animatedImageView.center = window.center;
    [animatedImageView startAnimating];
   
    
    UIImageView* bgImageView = [[UIImageView alloc] initWithFrame:window.bounds];
    bgImageView.backgroundColor = [self colorFromHexString:@"#ffffff"];
    //bgImageView.alpha = 0.5;
    
    
    [window addSubview:bgImageView];
    [window addSubview:animatedImageView];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [animatedImageView removeFromSuperview];
        [bgImageView removeFromSuperview];

    });
    
    
    RCTTriggerReloadCommandListeners(@"react-native-restart: Restart");
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


RCT_EXPORT_METHOD(Restart) {
    if ([NSThread isMainThread]) {
        [self loadBundle];
    } else {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self loadBundle];
        });
    }
    return;
}

@end
