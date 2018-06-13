
package com.varenslab.google.geometry;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import com.google.maps.android.PolyUtil;
import com.google.maps.android.SphericalUtil;
import com.google.android.gms.maps.model.LatLng;
import java.util.List;
import java.util.ArrayList;

public class RNGoogleGeometryModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNGoogleGeometryModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNGoogleGeometry";
  }

      @ReactMethod
    public void containsLocation(
        ReadableMap point,
        ReadableArray polygon,
        Callback completionCallback) {

      LatLng locationPoint = new LatLng(
          point.getDouble("latitude"),
          point.getDouble("longitude")
      );

      List<LatLng> polygonList = new ArrayList<>();

      for (int i = 0; i < polygon.size(); i++) {
        ReadableMap vertex = polygon.getMap(i);
        polygonList.add(
            new LatLng(
              vertex.getDouble("latitude"),
              vertex.getDouble("longitude")
            )
        );
      }

      boolean isWithinCoverage = PolyUtil.containsLocation(locationPoint, polygonList, false);

      completionCallback.invoke(isWithinCoverage);
    }

    @ReactMethod
    public void computeArea(
      ReadableArray polygon,
      Callback result
    ){
      List<LatLng> polygonList = new ArrayList<>();

      for (int i = 0; i < polygon.size(); i++) {
        ReadableMap vertex = polygon.getMap(i);
        polygonList.add(
          new LatLng(
            vertex.getDouble("latitude"),
              vertex.getDouble("longitude")
          )
        );
      }
      result.invoke(SphericalUtil.computeArea(polygonList));
    }

    @ReactMethod
    public void computeDistanceBetween (
      ReadableMap point1,
      ReadableMap point2,
      Callback result
    ) {
      LatLng p1 = new LatLng(point1.getDouble("latitude"), point1.getDouble("longitude"));
      LatLng p2 = new LatLng(point2.getDouble("latitude"), point2.getDouble("longitude"));
      result.invoke(SphericalUtil.computeDistanceBetween(p1, p2));
    }
}