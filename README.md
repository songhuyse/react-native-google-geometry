
# react-native-google-geometry

## Getting started

`$ npm install react-native-google-geometry --save`

### Mostly automatic installation

`$ react-native link react-native-google-geometry`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-google-geometry` and add `RNGoogleGeometry.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNGoogleGeometry.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

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
	{ lat: 11.59263082822001, lng: 104.88914139568806 },
	{ lat: 11.594118314815121, lng: 104.88916050642729 },
	{ lat: 11.59418958522588, lng: 104.8908070474863 },
	{ lat: 11.592780923826437, lng: 104.89092439413069 },
  ]; 

  let point = {
    lat: 2.951269758090068,
    lng: 101.964111328125
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
	{ lat: 11.59263082822001, lng: 104.88914139568806 },
	{ lat: 11.594118314815121, lng: 104.88916050642729 },
	{ lat: 11.59418958522588, lng: 104.8908070474863 },
	{ lat: 11.592780923826437, lng: 104.89092439413069 },
  ]; 

  RNGoogleGeometry.computeArea(polygon).then(area => console.log(area));
}
```

```js
// to calculate distance between two ponint
componentDidMount() {
  const p1 = { lat: 11.59263082822001, lng: 104.88914139568806 };
  const p2 = { lat: 11.59263082822001, lng: 104.88914139568806 };

  RNGoogleGeometry.computeDistanceBetween(p1, p2).then(distance => console.log(distance));
}
```


