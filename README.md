
# react-native-google-geometry

## Getting started

`$ npm install react-native-google-geometry --save`

### Mostly automatic installation ( working on android )

`$ react-native link react-native-google-geometry`

### Manual installation


#### iOS

1. `Copies` everything in ios folder and `Paste` into ➜ folder `[your project's name]/ios`
2. Open Podfile edit `target [your target name]`
3. Open `Terminal` ➜ cd your path `[your project's name]/ios`
4. Run command `pod install`
5. After success install, close XCode and open with extension `[your project's name].xcworkspace`
6. Click on your project's name go to `Build Settings`
7. find `Other Linker Flags` ➜ add `$(inherited)`
8. and then find `User Header Search Paths`
9. Paste `${SRCROOT}/../node_modules/react-native/React/Base` into `Debug` and `Release`

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.varenslab.google.geometry.RNGoogleGeometryPackage;` to the imports at the top of the file
  - Add `new RNGoogleGeometryPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-google-geometry'
  	project(':react-native-google-geometry').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-google-geometry/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-google-geometry')
  	```


## Usage
```javascript
import RNGoogleGeometry from 'react-native-google-geometry';

// TODO: What to do with the module?
RNGoogleGeometry;
```
  
```js
// with only point and polygon
componentDidMount() {
  const polygon = [
	{ latitude: 11.59263082822001, longitude: 104.88914139568806 },
	{ latitude: 11.594118314815121, longitude: 104.88916050642729 },
	{ latitude: 11.59418958522588, longitude: 104.8908070474863 },
	{ latitude: 11.592780923826437, longitude: 104.89092439413069 },
  ]; 

  let point = {
    latitude: 2.951269758090068,
    longitude: 101.964111328125
  };

  RNGoogleGeometry.containsLocation(point, polygon)
    .then(() => console.log('point is within polygon'))
    .catch(() => console.log('point is NOT within polygon'))
}
```

```js
// to calculate area of polygon
componentDidMount() {
  const polygon = [
	{ latitude: 11.59263082822001, longitude: 104.88914139568806 },
	{ latitude: 11.594118314815121, longitude: 104.88916050642729 },
	{ latitude: 11.59418958522588, longitude: 104.8908070474863 },
	{ latitude: 11.592780923826437, longitude: 104.89092439413069 },
  ]; 

  RNGoogleGeometry.computeArea(polygon).then(area => console.log(area));
}
```

```js
// to calculate distance between two ponint
componentDidMount() {
  const p1 = { latitude: 11.59263082822001, longitude: 104.88914139568806 };
  const p2 = { latitude: 11.59263082822001, longitude: 104.88914139568806 };

  RNGoogleGeometry.computeDistanceBetween(p1, p2).then(distance => console.log(distance));
}
```


