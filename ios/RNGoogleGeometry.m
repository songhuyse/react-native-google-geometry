//
//  RNGoogleGeometry.m
//  khmerhome
//
//  Created by Khmerload on 6/11/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "RNGoogleGeometry.h"
#import <GoogleMaps/GMSGeometryUtils.h>
#import <GoogleMaps/GMSMutablePath.h>

@implementation RNGoogleGeometry
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(
                  containsLocation:(NSDictionary *)point
                  polygon:(NSArray *)polygon
                  callback:(RCTResponseSenderBlock)callback
) {
  CLLocationCoordinate2D locationPoint = CLLocationCoordinate2DMake(
    [[point objectForKey:@"latitudeitude"] doubleValue],
    [[point objectForKey:@"longitude"] doubleValue]
  );
  GMSMutablePath *polygonPath = [GMSMutablePath path];
  for(int i = 0; i < [polygon count]; i++) {
    [polygonPath addCoordinate:CLLocationCoordinate2DMake(
      [[polygon[i] objectForKey:@"latitude"] doubleValue],
      [[polygon[i] objectForKey:@"longitude"] doubleValue]
    )];
  }
  if(GMSGeometryContainsLocation(locationPoint, (GMSPath *)polygonPath, NO)) {
    callback(@[@YES]);
  } else {
    callback(@[@NO]);
  }
}

RCT_EXPORT_METHOD(
                  computeDistanceBetween:(NSDictionary *)point1
                  point2:(NSDictionary *)point2
                  callback:(RCTResponseSenderBlock)callback
) {
  CLLocationCoordinate2D p1 = CLLocationCoordinate2DMake(
    [[point1 objectForKey:@"latitude"] doubleValue],
    [[point1 objectForKey:@"longitude"] doubleValue]
  );
  CLLocationCoordinate2D p2 = CLLocationCoordinate2DMake(
    [[point2 objectForKey:@"latitude"] doubleValue],
    [[point2 objectForKey:@"longitude"] doubleValue]
  );
  NSNumber *distance = [NSNumber numberWithDouble:GMSGeometryDistance(p1, p2)];
  callback(@[distance]);
}

RCT_EXPORT_METHOD(
                  computeArea:(NSArray *)polygon
                  callback:(RCTResponseSenderBlock) callback
) {
  GMSMutablePath *polygonPath = [GMSMutablePath path];
  for(int i = 0; i < [polygon count]; i++) {
    [polygonPath addCoordinate:CLLocationCoordinate2DMake(
      [[polygon[i] objectForKey:@"latitude"] doubleValue],
      [[polygon[i] objectForKey:@"longitude"] doubleValue]
    )];
  }
  NSNumber *area = [NSNumber numberWithDouble:GMSGeometryArea((GMSPath *)polygonPath)];
  callback(@[area]);
}

@end

