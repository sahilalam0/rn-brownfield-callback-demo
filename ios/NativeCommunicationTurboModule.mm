//
//  NativeCommunicationTurboModule.mm
//  RnBrownfieldCallbackDemo
//
//  Turbo Module implementation following official RN docs
//

#import <Foundation/Foundation.h>

#ifdef RCT_NEW_ARCH_ENABLED

#import <RnBrownfieldCallbackDemoSpec/RnBrownfieldCallbackDemoSpec.h>

@interface NativeCommunicationTurboModule : NativeCommunicationSpecBase <NativeCommunicationSpec>
@end

@implementation NativeCommunicationTurboModule

RCT_EXPORT_MODULE(NativeCommunication)

- (instancetype)init {
  self = [super init];
  if (self) {
    NSLog(@"📡 [NativeCommunicationTurboModule] TurboModule initialized");
  }
  return self;
}

- (void)processEvents:(RCTPromiseResolveBlock)resolve
               reject:(RCTPromiseRejectBlock)reject {
  NSLog(@"🎯 [NativeCommunicationTurboModule] processEvents called");
  
  // Look for the NativeCommunicationService in the Native iOS App
  Class serviceClass = NSClassFromString(@"NativeIOSApp.NativeCommunicationService");

  if (serviceClass) {
    id sharedService = [serviceClass valueForKey:@"shared"];
    NSLog(@"🔍 [NativeCommunicationTurboModule] Service shared "
          @"instance: %@",
          sharedService ? @"YES" : @"NO");
    if (sharedService &&
        [sharedService respondsToSelector:@selector(processEvents)]) {
      NSLog(@"🎯 [NativeCommunicationTurboModule] Found registered "
            @"processEvents, delegating call");

      // Call the service (no parameters needed)
      NSString *response =
          [sharedService performSelector:@selector(processEvents)];

      NSLog(@"✅ [NativeCommunicationTurboModule] Received response from "
            @"registered service: %@", response);
      if (response == nil) {
        NSLog(@"⚠️ [NativeCommunicationTurboModule] Service returned nil response");
        reject(@"NO_RESPONSE", @"Service returned nil response", nil);
        return;
      }
      resolve(response);
      return;
    } else {
      NSLog(@"⚠️ [NativeCommunicationTurboModule] NativeCommunication not "
            @"available or doesn't respond to processEvents");
      reject(@"NO_PROCESS_EVENTS", @"Service does not implement processEvents",
             nil);
      return;
    }
  }
  reject(@"NO_SERVICE", @"Could not find NativeCommunicationService",
         nil);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeCommunicationSpecJSI>(params);
}

@end

#endif // RCT_NEW_ARCH_ENABLED
